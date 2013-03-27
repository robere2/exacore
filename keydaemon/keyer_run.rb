require './keyer.so'
include Keyer

keyer = KeyerApp.new

scbd = SvgSubprocessCharacterGenerator.new(
    #'cd /root/scoreboard; ruby scoreboard_server.rb', 1
    'cd /root/scoreboard_fb; ruby scoreboard_server.rb', 1
)

scbd.set_x 150
scbd.set_y 50
#scbd.set_x 0
#scbd.set_y 0

keyer.cg scbd

bug = SvgSubprocessCharacterGenerator.new(
    'cd ..; ruby scoreboard/static_svg.rb /root/bug.svg'
)

bug.set_x 0
bug.set_y 0

keyer.cg bug

graphics = PngSubprocessCharacterGenerator.new(
    'cd ../svg_http_keyer; ruby svg_http_keyer.rb'
)

graphics.set_x 0
graphics.set_y 0

keyer.cg graphics

inp = create_decklink_input_adapter_with_audio(0, 0, 0, RawFrame::CbYCrY8422)
out1 = create_decklink_output_adapter_with_audio(1, 0, RawFrame::CbYCrY8422)
out2 = create_decklink_output_adapter_with_audio(2, 0, RawFrame::CbYCrY8422)

keyer.input inp
keyer.output out1
keyer.output out2

keyer.run
