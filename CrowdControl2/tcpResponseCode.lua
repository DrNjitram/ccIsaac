local ResponseCode = {
    --The effect executed successfully.
    success = 0,
    --The effect failed to trigger, but is still available for use. Viewer(s) will be refunded.
    failure = 1,
    --Same as <see cref="Failure"/> but the effect is no longer available for use.
    unavailable = 2,
    --The effect cannot be triggered right now, try again in a few seconds.
    retry = 3,
    --INTERNAL USE ONLY. The effect has been queued for execution after the current one ends.
    queue = 4,
    --INTERNAL USE ONLY. The effect triggered successfully and is now active until it ends.
    running = 5,
    --The timed effect has been paused and is now waiting.
    paused = 6,
    --The timed effect has been resumed and is counting down again.
    resumed = 7,
    --The timed effect has finished.
    finished = 8
}

return ResponseCode