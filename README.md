# Dig's Daybook

## Intent

For accounting of time focused, insights gathered, and learning.

Certain meeting notes or notes to self during certain meetings may be helpful.

## Format

Each day gets a folder. `daily.md` contains the main dairy entry written largely in prose.
Code samples can be added to the folder where applicable.

A `time.json` can be added if time tracking proves to be ideal.

Code snippets or relevant files can be added to each day's folder.

## Week in Review

~~[TODO] Way to script pulling in the "todos" from the past 5 days?~~

Generate a follow ups file with the week prior to the most recent Monday (including today). 

```
$ ./week_follow-ups.sh 
```

You can generate the follow-ups file for a previous week passing argument for how many weeks back. 
The default is `1`.

```
$ ./week_follow-ups.sh 2
```

[TODO] Create option for current week
[TODO] Allow missing days to be appended to existing file

# Make previous day

`./make_day.sh -d 1d` or `./make_day.sh -d 2d`

## Access

Intended to be private. May want to generalize down the road after more features exist.