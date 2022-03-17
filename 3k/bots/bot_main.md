
## Behavior of `..`

- turn off idle gohome timer/script (enabled after 900s / 15m, goes off after 100s more)
- set state
- wait for directions from next =S=
  - triggered by "glance"
  - but not movement in mapoff mode
  - reset bot state
  - set stepping state to true
  - set a one-time trigger on newline
    - take items and coins if present
- set _check_mob
  - set stepping state to false
  - set one time trigger
    - check for player
      - move on if present
      - .pause (pause the stepper, kill the stepper class)
      - engage the enemy if present, set state
- CONTRACT: area-bot implementation calls check_mob after checking for mob,assigning $mobname

- Corpse trig triggers .bot, an alias for .. wrapped with a check for halt being false