student_data = {"name":"Balaji", "class":"IT", "cgpa":9.22}
print("Printing the entire dictionary!")
print(student_data)
print("using get() will not throw error when key not present")
print(student_data.get("name"))

print("Adding into dict")
student_data["year"] = 2020
print(student_data)
print("Removing from dict")
student_data.pop("cgpa")
print(student_data)
print("Remove using del")
del student_data["year"]
print(student_data)