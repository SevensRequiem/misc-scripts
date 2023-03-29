import os
import random
import string
import datetime
import exiftool
import concurrent.futures
from tqdm import tqdm
from PIL import Image

# Colors for verbose output
class colors:
    MAGENTA = '\033[35m'
    CYAN = '\033[36m'
    END = '\033[0m'

# Owner website
owner_website = "https://requiem.moe"

# Function to generate a random string of characters
def generate_random_string(length=6):
    return ''.join(random.choice(string.ascii_letters) for i in range(length))

# Function to rename a single media file using its creation date and a random string
def rename_media_file(file_path, pbar):
    file_ext = os.path.splitext(file_path)[-1].lower()

    # Check if the file is a media file
    if file_ext in ['.jpg', '.png', '.jpeg', '.webm', '.gif', '.mp4']:
        # Get the file creation date
        creation_date = datetime.datetime.fromtimestamp(os.path.getctime(file_path)).strftime('%Y%m%d%H%M%S')

        # Check if the file has already been renamed
        if creation_date in file_path:
            pbar.write(f"{colors.MAGENTA}Skipping{colors.END}: {colors.CYAN}{file_path}{colors.END}")
            return

        # Generate a random string for the new file name
        random_string = generate_random_string()

        # Construct the new file name
        new_file_name = f"{creation_date}{random_string}{file_ext}"
        new_file_path = os.path.join(os.path.dirname(file_path), new_file_name)

        # Add owner/website metadata to the file
        os.system(f'exiftool -overwrite_original -Artist="{owner_website}" "{file_path}"')

        # Rename the file
        os.rename(file_path, new_file_path)

        pbar.write(f"{colors.MAGENTA}Renamed{colors.END}: {colors.CYAN}{file_path}{colors.END} --> {colors.CYAN}{new_file_path}{colors.END}")

# Function to rename media files in a folder using multi-threading
def rename_media_files(folder_path):
    with concurrent.futures.ThreadPoolExecutor() as executor:
        pbar = tqdm(total=sum([len(files) for r, d, files in os.walk(folder_path)]), unit='file')
        for subdir, dirs, files in os.walk(folder_path):
            for file in files:
                file_path = os.path.join(subdir, file)
                executor.submit(rename_media_file, file_path, pbar)
                pbar.update(1)

# Function to convert .webp files to .png files
def convert_webp_to_png(file_path):
    file_ext = os.path.splitext(file_path)[-1].lower()

    # Check if the file is a .webp file
    if file_ext == '.webp':
        new_file_name = os.path.splitext(file_path)[0] + '.png'
        new_file_path = os.path.join(os.path.dirname(file_path), new_file_name)

        # Convert the file
        try:
            img = Image.open(file_path).convert('RGBA')
            img.load()
            img.save(new_file_path, format='PNG')
            os.remove(file_path) # Remove original .webp file after conversion
            return new_file_path
        except:
            pass

# Function to convert .webp files in a folder using multi-threading
def convert_webp_files(folder_path):
    with concurrent.futures.ThreadPoolExecutor(max_workers=10) as executor:
        for subdir, dirs, files in os.walk(folder_path):
            for file in files:
                file_path = os.path.join(subdir, file)
                executor.submit(convert_webp_to_png, file_path)


#Main function
if __name__ == '__main__':
    folder_path = input("Enter the path of the folder containing the media files: ")
    print(f"Renaming media files in {folder_path}...")
    rename_media_files(folder_path)
    print("Media files renamed successfully.")
    print(f"Converting .webp files in {folder_path} to .png files...")
    convert_webp_files(folder_path)
    print(".webp files converted to .png files successfully.")

