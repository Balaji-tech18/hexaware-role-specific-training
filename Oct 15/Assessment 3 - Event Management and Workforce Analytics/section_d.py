class Event:
    def __init__(self, event_id, event_name, capacity, ticket_price):
        self.event_id = event_id
        self.event_name = event_name
        self.capacity = capacity
        self.ticket_price = ticket_price

    def display_event(self):
        print(f"{self.event_name} ({self.event_id}), capacity {self.capacity}, ticket price {self.ticket_price}")

    def calculate_revenue(self, tickets_sold):
        return tickets_sold * self.ticket_price

class OnlineEvent(Event):
    def __init__(self, event_id, event_name, capacity, ticket_price, platform):
        super().__init__(event_id, event_name, capacity, ticket_price)
        self.platform = platform

    def display_event(self):
        print(f"{self.event_name} ({self.event_id}), capacity {self.capacity}, ticket price {self.ticket_price}, platform {self.platform}")

class PhysicalEvent(Event):
    def __init__(self, event_id, event_name, capacity, ticket_price, venue):
        super().__init__(event_id, event_name, capacity, ticket_price)
        self.venue = venue

    def display_event(self):
        print(f"{self.event_name} ({self.event_id}), capacity {self.capacity}, ticket price {self.ticket_price}, venue {self.venue}")

events = [
    Event("E101", "AI Innovation Summit", 500, 2500),
    OnlineEvent("E102", "Leadership Forum", 350, 1800, "Zoom"),
    PhysicalEvent("E103", "Data Engineering Bootcamp", 200, 3000, "Bangalore Convention Centre")
]
for event in events:
    event.display_event()
    print(event.calculate_revenue(10))
