self-screen-spy
===============================================================================

> a good quantitative exercise is taking snapshots of your monitor every 30
> seconds (autoscreen) for a day, or two, then reviewing where you're spending
> your time on, and deciding whether you're okay with such allocation of your
> time

-- <https://sdrinf.com/age-of-attention>

dependencies
-------------------------------------------------------------------------------

- `snapshot.sh`: <https://en.wikipedia.org/wiki/Scrot>
- `compile.sh`: <https://en.wikipedia.org/wiki/FFmpeg>

usage
-------------------------------------------------------------------------------

### Record

#### intervals >= 1 min

Call `snapshot.sh` from cron.

#### intervals < 1 min

Run `loop.sh` from wherever you like.

### Review

#### compiled video

Run `compile.sh` and then watch the resulting `${date}.mp4` videos.

#### individual screenshots

Are placed in `data/${date}`.
