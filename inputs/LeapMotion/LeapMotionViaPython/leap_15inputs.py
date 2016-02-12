import time
import itertools

from leap_python3 import Leap
from leap_python3.Leap import Finger

from pythonosc.osc_message_builder import OscMessageBuilder
from pythonosc.udp_client import UDPClient

HAND = 'left'
FINGERS = [Finger.TYPE_THUMB, Finger.TYPE_INDEX, Finger.TYPE_MIDDLE,
           Finger.TYPE_RING, Finger.TYPE_PINKY]

client = UDPClient('127.0.0.1', 6448)


def is_expected_hand(hand):
    if HAND.lower() == 'left':
        return hand.is_left
    if HAND.lower() == 'right':
        return hand.is_right
    raise ValueError('Unrecognized HAND value: {}'.format(HAND))


def populate_hand_dict_from_fingers(hand_dict, fingers):
    for finger in fingers:
        if is_expected_hand(finger.hand):
            hand_dict[finger.type] = finger.tip_position.to_tuple()


def get_raw_tip_positioning_data(frame):
    hand_dict = {f: (0, 0, 0) for f in FINGERS}
    populate_hand_dict_from_fingers(hand_dict, frame.fingers)
    return itertools.chain.from_iterable(hand_dict[f] for f in FINGERS)


def build_osc_message(positioning_values):
    builder = OscMessageBuilder(address='/wek/inputs')
    for v in positioning_values:
        builder.add_arg(v)
    return builder.build()


class SimpleListener(Leap.Listener):
    def on_frame(self, controller):
        frame = controller.frame()
        positioning_values = get_raw_tip_positioning_data(frame)
        msg = build_osc_message(positioning_values)
        client.send(msg)
        time.sleep(0.05)


controller = Leap.Controller()
listener = SimpleListener()
controller.add_listener(listener)

input("Press Enter to quit...")
