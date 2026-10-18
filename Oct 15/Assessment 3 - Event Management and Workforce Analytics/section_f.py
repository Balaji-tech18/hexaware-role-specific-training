import csv

with open("registrations.csv", newline="", encoding="utf-8") as file:
    registrations = list(csv.DictReader(file))

print([registration for registration in registrations if registration["status"] == "Confirmed"])
print([registration for registration in registrations if registration["city"] == "Hyderabad"])

for registration in registrations:
    registration["amount"] = float(registration["amount"])

print([registration for registration in registrations if registration["amount"] > 7000])
print(sum(registration["amount"] for registration in registrations))
print(set(registration["city"] for registration in registrations))
