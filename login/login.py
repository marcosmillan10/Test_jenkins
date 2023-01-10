# -*- coding: utf-8 -*-
"""
Created on friday 20 Jul 2022
@author: marcos.millan@gigas.com
"""


from datetime import datetime
from time import sleep

def enter_login_page_False():
    """Enter the login page

    Args:
        test (test_config()): Test configuration
    """
    sleep(2)
    assert(2 + 2 == 4)
    sleep(2)
    assert(4 + 2 == 6)
    sleep(2)
    assert(2 + 2 == 4)
    sleep(2)
    assert(4 + 2 == 6)
    assert(1==2)


def enter_login_page():
    """Enter the login page

    Args:
        test (test_config()): Test configuration
    """
    sleep(2)
    assert(2 + 2 == 4)
    sleep(2)
    assert(4 + 2 == 6)
    sleep(2)
    assert(2 + 2 == 4)
    sleep(2)
    assert(4 + 2 == 6)

