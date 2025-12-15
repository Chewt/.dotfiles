#!/bin/python
# Swap sink to next in list
import subprocess
import shlex

class Sink:
    def __init__(self, uid, name, status, description):
        self.uid = int(uid)
        self.name = name
        self.status = status
        self.description = description

    def __str__(self):
        return f"{self.uid} {self.name} {self.status} {self.description}"

def get_sinks() -> list[Sink]:
    lines = subprocess.run(["pamixer", "--list-sinks"], capture_output=True).stdout.decode("utf-8").strip().split('\n')[1:]
    sinks = []
    for line in lines:
        items = shlex.split(line)
        sinks.append(Sink(*items))
    sinks.sort(key=lambda x: x.uid)
    return sinks

def switch_to_sink(sink: Sink):
    subprocess.run(["pactl", "set-default-sink", sink.name])

def notify_new_sink(sink: Sink):
    subprocess.run(["notify-send", "-e", "-u", "low", "Audio Sink:", sink.description])

def main():
    sinks: list[Sink] = get_sinks()
    found_index = -1
    for i in range(len(sinks)):
        if sinks[i].status == "Running":
            found_index = i
            break
    if found_index != -1:
        next_sink = (found_index + 1) % len(sinks)
        switch_to_sink(sinks[next_sink])
        notify_new_sink(sinks[next_sink])


if __name__ == "__main__":
    main()
