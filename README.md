# Game Dev Tutorial 3

<p align='Center'>
    <a href="https://github.com/sponsors/alexandresanlim">
        <img src="https://img.shields.io/badge/Godot-478CBF?style=for-the-badge&logo=GodotEngine&logoColor=white"/>
            <center>
                <h2>v3.5.3 LTS</h2>
            </center>  
    </a>
</p>

## 🕹️ Latihan Mandiri - Mechanics Exploration & Implementation 🕹️

- ### Double jump

    > Player have the ability to perform jump twice in a short span course of action.
    
    My implementation is having a jump input functions that firstly checks if the player is currently at floor base level to reset the jump count in order to counter "jump spamming" and the idea is that the y axis is influenced based on JUMP_POWER value, which in godot engine cases, y axis is inverted thus making it -y to go up instead.

    ```go
        // Player.gd

        func handle_jump_input():
            if is_on_floor() and jumpCount != 0:
                jumpCount = 0

            if jumpCount < MAX_JUMP_COUNT and Input.is_action_just_pressed("jump"):
                motion.y = -JUMP_POWER
                jumpCount += 1
    ```

- ### Dashing

    > Player have the ability to perform a dashing action in the direction they are currently taking.

    Since godot engine has its own Timer node for executing actions after a certain amount of time has elapsed. It's particularly useful for implementing time-based events, delays, or periodic actions, especially with player dashing mechanic. I started with having the start_dash functions to wait out the given duration param and having the is_dashing() for player speed terminations on whether or not the said player is still having the "dash speed" or normal moving speed.

    ```go
        // Dash.gd

        onready var timer = $"Dash Timer"

        func start_dash(duration):
            timer.wait_time = duration
            timer.start()

        func is_dashing():
            return !timer.is_stopped()
    ```
    ```go
        // Player.gd

        var speed = get_speed()

        if Input.is_action_just_pressed("dash"):
            dash.start_dash(DASH_LENGTH)
        
        func get_speed():
            if dash.is_dashing():
                return DASH_SPEED
                
            else:
                return NORMAL_SPEED
    ```


- ### Sliding

    > Player have the ability to perform a slide action whenever they start moving left or right direction.

    This one is pretty straightforward, since sliding technically makes the character duck thus having smaller hitbox, so i started with disabling the current standing hitbox and enable the sliding hitboxes. Lastly, load the sprite animation for sliding.

    ```go
        // Player.gd

        elif Input.is_action_pressed("slide"):
            $StandingHitbox.disabled = true
            $SlidingHitbox.disabled = false
            $AnimatedSprite.play("slide")
    ```

##
## 🖮 Control & Keybinds 🖮

> As per usual, i decided to rebind the main control keys for our convenience.

- *W* = Jump, double tap it for double jump

- *A* = Move left

- *D* = Move right

- *A + S* = Slide left

- *D + S* = Slide right

- *E* = Dash to currently faced direction