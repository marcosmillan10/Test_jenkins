# -*- coding: utf-8 -*-
"""
Created on friday 20 Jul 2022
@author: marcos.millan@gigas.com
"""

from .login import enter_login_page

from selenium import webdriver

from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.core.utils import ChromeType

def test_LOGIN_enter_login_page():
    """ Check correct loggin

    Args:
        pytest_variables (array(map)): object with different values of the variables
    """
    print('\nINIT')
    enter_login_page()
    print('\nFIN')


def test_google():
    print('\nINIT')
    chrome_service = ChromeService(ChromeDriverManager().install())
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument("--incognito")
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('--disable-gpu')
    print('aaaaaaaaaaaaaaaaaaa')
    driver = webdriver.Chrome(service = chrome_service, options=chrome_options) # OK
    print('bbbbbbbbbbbbb')
    driver.set_window_position(5000, 18000)
    driver.maximize_window()
    driver.implicitly_wait(10)
    driver.get('https://google.com')
    assert(driver.title == 'Google')
    print('\nFIN')