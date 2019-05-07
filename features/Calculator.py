class Calculator:
    def __init__(self, number1, number2):
        self.number1 = number1
        self.number2 = number2

    def set_number1(self, number):
        self.number1 = number

    def set_number2(self, number):
        self.number2 = number

    def add(self):
        return self.number1 + self.number2
