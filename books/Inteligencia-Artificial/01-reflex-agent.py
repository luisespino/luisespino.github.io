import time
import random

def reflex_agent(temperature):
    if temperature > 75:
        return 'Turn on'
    return 'Turn off'

def main():
    while True:
        temperature = random.randint(60, 90)
        action = reflex_agent(temperature)
        print(f"Temperature: {temperature} Action: {action}")
        time.sleep(3)

if __name__ == "__main__":
    main()