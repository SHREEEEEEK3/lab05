#!/user/bin/lua5.3

lgi = require('lgi')
gtk = lgi.require("Gtk", "3.0")
pixbuf = lgi.GdkPixbuf.Pixbuf
gtk.init()

bld = gtk.Builder()
bld:add_from_file("lab05.glade")

ui = bld.objects
px = {}
px[1] = pixbuf.new_from_file('Apelsin.png')
px[2] = pixbuf.new_from_file('Chernika.png')
px[3] = pixbuf.new_from_file('Grusha.png')
px[4] = pixbuf.new_from_file('Klubnika.png')
px[5] = pixbuf.new_from_file('Limon.png')
px[6] = pixbuf.new_from_file('Vinograd.png')
px[7] = pixbuf.new_from_file('Vishnya.png')
px[8] = pixbuf.new_from_file('Yabloko.png')
px[9] = pixbuf.new_from_file('Zemlyanika.png')

ui.Button.on_clicked = function ()
	im = ui.Combo:get_active(ui.List2) + 1
	ui.List1[ui.List1:append()] = {[1] = tonumber(ui.Entry1.text), [2] = ui.Entry2.text, [3] = px[im]}
	ui.Entry1.text = ""
	ui.Entry2.text = ""
end

ui.Window.on_destroy = gtk.main_quit
ui.Window:show_all()

gtk.main()
