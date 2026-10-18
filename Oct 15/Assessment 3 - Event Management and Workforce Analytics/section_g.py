import json

with open("staff.json", encoding="utf-8") as file:
    staff = json.load(file)

print(type(staff))
print([person["name"] for person in staff])
print([person for person in staff if person["department"] == "Operations"])
print([person for person in staff if person["salary"] > 75000])
print([person for person in staff if "Python" in person["skills"]])
print([(person["name"], person["performance"]["rating"], person["performance"]["events_handled"]) for person in staff])
print([person for person in staff if person["performance"]["rating"] > 4.5])

skills = [skill for person in staff for skill in person["skills"]]
print(skills)
print(set(skills))
print(sorted(staff, key=lambda person: person["salary"], reverse=True))
print(sorted(staff, key=lambda person: person["performance"]["rating"], reverse=True))

for person in staff:
    if person["staff_id"] == 503 and "Pandas" not in person["skills"]:
        person["skills"].append("Pandas")

with open("staff_updated.json", "w", encoding="utf-8") as file:
    json.dump(staff, file, indent=2)
