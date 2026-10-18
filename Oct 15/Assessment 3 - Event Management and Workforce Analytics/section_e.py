with open("event_log.txt", "w", encoding="utf-8") as file:
    file.write("Registration records loaded\n")
    file.write("Confirmed attendees processed\n")
    file.write("Event capacity checked\n")

with open("event_log.txt", "a", encoding="utf-8") as file:
    file.write("Revenue summary generated\n")
    file.write("Event report completed\n")

with open("event_log.txt", "r", encoding="utf-8") as file:
    print(file.read())

with open("event_log.txt", "r", encoding="utf-8") as file:
    for line in file:
        print(line, end="")
