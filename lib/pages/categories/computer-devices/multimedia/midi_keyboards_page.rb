# encoding: utf-8

class CategoryComputerDevicesMultimediaMIDIKeyboardsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/multimedia/midi_keyboards"
  @category = "Компьютерная техника -> Мультимедиа -> MIDI-клавиатуры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"
end
