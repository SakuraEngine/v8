import("core.base.json")
function main(package_path, manifest_path)
    local packages = os.files(path.join(os.curdir(), package_path))
    local manifest = {}
    for _, package in ipairs(packages) do
        package_name = path.filename(package)
        package_sha = hash.sha256(package)
        manifest[package_name] = package_sha
    end
    json.savefile(manifest_path, manifest)
end