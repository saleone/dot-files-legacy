-- debuging
debug_print("Window Name: " .. get_window_name())
debug_print("Application name: " .. get_application_name())

if (get_window_name() == "bg_player_term") then
    set_window_geometry2(305, -20, 750, 250)
    undecorate_window()
    pin_window()
    stick_window()
    set_skip_tasklist(true)
    set_skip_pager(true)
    set_window_below()
end
