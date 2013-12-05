def normalize_path(path)
  "#{"#{Dir.pwd}/" if relative_path?(path)}#{path}"
end

def relative_path?(path)
  !absolute_path?(path)
end

def absolute_path?(path)
  path.start_with?("/")
end