# Bash File Organizer

A simple Bash script that automatically organizes files into
categorized folders based on their file extensions.

## Features

* Organizes images, documents, videos, and archives
* Supports multiple file extensions
* Handles file names containing spaces
* Creates destination folders automatically
* Places unknown file types in an `Others` folder
* Handles duplicate file names by automatically renaming them
* Logs file operations to `log.txt`
* Ignores `log.txt` during file organization

## Categories

| Category  | Extensions              |
| --------- | ----------------------- |
| Images    | `.png`, `.jpg`, `.jpeg` |
| Documents | `.pdf`, `.txt`          |
| Videos    | `.mp4`, `.mkv`          |
| Archives  | `.zip`, `.rar`          |
| Others    | All other file types    |

## Usage

```bash
./bash.sh /path/to/directory
```

For example:

```bash
./bash.sh ~/Downloads
```

The script creates the following folders inside the target directory:

```text
Images/
Documents/
Videos/
Archives/
Others/
log.txt
```

If a file with the same name already exists, the script automatically
creates a unique name:

```text
photo.jpg
photo_1.jpg
photo_2.jpg
```

File operations are recorded in `log.txt`.

