.global _start

.extern write_to_file

.data
gpio_export:    .asciz "/sys/class/gpio/export"
gpio_direction: .asciz "/sys/class/gpio/gpio588/direction"
gpio_value:     .asciz "/sys/class/gpio/gpio588/value"
value_on:       .asciz "1"
value_off:      .asciz "0"
direction_out:  .asciz "out"
gpio_number:    .asciz "588"

.text
_start:
    ldr x0, =gpio_export        // Export GPIO17
    ldr x1, =gpio_number
    bl write_to_file

    ldr x0, =gpio_direction     // Configure GPIO17 as output
    ldr x1, =direction_out
    bl write_to_file

    ldr x0, =gpio_value         // power on 
    ldr x1, =value_on
    bl write_to_file

    ldr x0, =gpio_value         // power off
    ldr x1, =value_off
    bl write_to_file

    ldr x0, =gpio_export        // free GPIO17
    ldr x1, =gpio_number
    bl write_to_file

    mov x0, #0                  // exit
    mov x8, #93                 
    svc #0
