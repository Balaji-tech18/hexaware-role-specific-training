import json

with open("employees.json", encoding="utf-8") as file:
    employees = json.load(file)

print([employee["name"] for employee in employees])
print([employee for employee in employees if employee["salary"] > 75000])
print([employee for employee in employees if "Python" in employee["skills"]])
print([(employee["name"], employee["performance"]["rating"]) for employee in employees])
print([employee for employee in employees if employee["performance"]["rating"] > 4.5])
print(sorted(employees, key=lambda employee: employee["performance"]["rating"], reverse=True))

for employee in employees:
    if employee["employee_id"] == 303 and "Pandas" not in employee["skills"]:
        employee["skills"].append("Pandas")

with open("employees_updated.json", "w", encoding="utf-8") as file:
    json.dump(employees, file, indent=2)
