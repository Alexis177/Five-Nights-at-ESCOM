from pathlib import Path
import json
import re

def read_gm(path):
    # GameMaker permits trailing commas; remove only commas outside strings.
    text = path.read_text(encoding="utf-8-sig")
    result = []
    quoted = escaped = False
    for i, char in enumerate(text):
        if quoted:
            result.append(char)
            if escaped: escaped = False
            elif char == "\\": escaped = True
            elif char == '"': quoted = False
        else:
            if char == '"': quoted = True
            if char == "," and text[i+1:].lstrip().startswith(("}", "]")): continue
            result.append(char)
    return json.loads("".join(result))

root = Path(__file__).resolve().parents[1]
project = read_gm(root / "Five Nights at ESCOM.yyp")
for resource in project["resources"]:
    path = root / resource["id"]["path"]
    assert path.is_file(), f"Missing resource: {path}"
    read_gm(path)
for room in project["RoomOrderNodes"]:
    assert (root / room["roomId"]["path"]).is_file()
for path in root.glob("objects/*/*.gml"):
    assert not re.search(r"^(<{7}|={7}|>{7})(?: |$)", path.read_text(encoding="utf-8-sig"), re.M), f"Merge conflict: {path}"
print(f"Validated {len(project['resources'])} resource files, room order and GML conflict markers.")
print("Static validation only: no GameMaker compilation or runtime test.")
