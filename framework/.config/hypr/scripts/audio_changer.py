#!/usr/bin/env python
import subprocess
import tkinter as tk
from tkinter import ttk

# Function to parse output of command "wpctl status" and return a dictionary of sinks with their id and name.
def parse_wpctl_status():
    # Execute the wpctl status command and store the output in a variable.
    output = str(subprocess.check_output("wpctl status", shell=True, encoding='utf-8'))

    # Remove the ASCII tree characters and return a list of lines
    lines = output.replace("├", "").replace("─", "").replace("│", "").replace("└", "").splitlines()

    # Get the index of the Sinks line as a starting point
    sinks_index = None
    for index, line in enumerate(lines):
        if "Sinks:" in line:
            sinks_index = index
            break

    # Start by getting the lines after "Sinks:" and before the next blank line and store them in a list
    sinks = []
    for line in lines[sinks_index + 1:]:
        if not line.strip():
            break
        sinks.append(line.strip())

    # Remove the "[vol:" from the end of the sink name
    for index, sink in enumerate(sinks):
        sinks[index] = sink.split("[vol:")[0].strip()

    # Strip the * from the default sink and instead append "- Default" to the end. Looks neater in the list this way.
    for index, sink in enumerate(sinks):
        if sink.startswith("*"):
            sinks[index] = sink.strip().replace("*", "").strip() + " - Default"

    # Make the dictionary in this format {'sink_id': <int>, 'sink_name': <str>}
    sinks_dict = [{"sink_id": int(sink.split(".")[0]), "sink_name": sink.split(".")[1].strip()} for sink in sinks]

    return sinks_dict

# Function to create and display the GUI window for selecting a sink with a dark theme
def select_sink_gui(sinks):
    root = tk.Tk()
    root.title("AudioSink")
    root.configure(bg='#2d2d2d')

    style = ttk.Style()
    style.theme_use('clam')  # Use the 'clam' theme for more customization options

    # Configure styles for dark theme
    style.configure('TLabel', background='#2d2d2d', foreground='white', font=('Helvetica', 12))
    style.configure('TRadiobutton', background='#2d2d2d', foreground='white', font=('Helvetica', 12))
    style.configure('TButton', background='#007BFF', foreground='white', font=('Helvetica', 12), borderwidth=1)
    style.map('TButton', background=[('active', '#0056b3')])

    # Customize the appearance of the radio buttons when selected
    style.map('TRadiobutton',
             background=[('selected', '#007BFF')],
             foreground=[('selected', 'white')])

    label = ttk.Label(root, text="Select an audio sink:")
    label.pack(pady=10)

    selected_sink = tk.IntVar()

    for index, sink in enumerate(sinks):
        radio_button = ttk.Radiobutton(root, text=sink['sink_name'], variable=selected_sink, value=index)
        radio_button.pack(anchor=tk.W, padx=20, pady=5)

    def on_select():
        selected_index = selected_sink.get()
        root.selected_sink_id = sinks[selected_index]['sink_id']
        root.destroy()

    select_button = ttk.Button(root, text="Select", command=on_select)
    select_button.pack(pady=20)

    root.mainloop()

    return getattr(root, 'selected_sink_id', None)

# If there's only 2 outputs then action just switch and return the next id, if there's more, show a GUI window for selection
def get_selected_sink_id(sinks):
    if len(sinks) == 2:
        for index, item in enumerate(sinks):
            if not item['sink_name'].endswith(" - Default"):
                return item['sink_id']
    else:
        return select_sink_gui(sinks)

sinks = parse_wpctl_status()
selected_sink_id = get_selected_sink_id(sinks)

if selected_sink_id is not None:
    subprocess.run(f"wpctl set-default {selected_sink_id}", shell=True)
else:
    print("No sink selected.")
