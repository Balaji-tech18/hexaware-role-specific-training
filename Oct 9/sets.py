games = {"Cricket","Football"}

games.add("Golf")

games.add("Golf")

print("Set do not allows duplicates")
print(games)

print("Remove throws errors if not present so use discard()")
print("Removed Cricket")
games.discard("Cricket")
print("removed Cricket again using discard() doesn't show error.")
print(games.discard("Cricket"))



