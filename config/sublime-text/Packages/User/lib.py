import os

def is_exist_view(view):
    path = view.file_name()
    if path and len(path) > 0 and os.path.exists(path):
        return True
    return False

def get_relative_path(abs_path, window):
    root_paths = window.folders()
    relative_path = abs_path
    for root in root_paths:
        if abs_path.startswith(root):
            relative_path = os.path.relpath(abs_path, root)
            break
    return relative_path

def get_first_root_path(window):
    root_paths = window.folders()
    result = None
    for root in root_paths:
        result = root
        break
    return result