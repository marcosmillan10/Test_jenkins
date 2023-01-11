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
    ''';--test-type;--no-sandbox;--ignore-certificate-errors;
                   --disable-popup-blocking;--disable-default-apps;--disable-extensions-file-access-check;
                   --incognito;--disable-infobars,--disable-gpu'''
    #https://github.com/serenity-bdd/serenity-core/issues/1756
    chrome_options.add_argument("--start-maximized")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--ignore-certificate-errors")
    chrome_options.add_argument("--disable-popup-blocking")
    chrome_options.add_argument("--disable-default-apps")
    chrome_options.add_argument("--disable-extensions-file-access-check")
    chrome_options.add_argument("--incognito")
    chrome_options.add_argument("--disable-infobars")
    chrome_options.add_argument("--disable-gpu")

    '''chrome_options.add_argument("--incognito")
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('--disable-gpu')'''
    print('aaaaaaaaaaaaaaaaaaa')
    #driver = webdriver.Chrome(service = chrome_service, options=chrome_options) # OK
    driver = webdriver.Chrome()
    print('bbbbbbbbbbbbb')
    driver.set_window_position(5000, 18000)
    driver.maximize_window()
    driver.implicitly_wait(10)
    driver.get('https://google.com')
    assert(driver.title == 'Google')
    print('\nFIN')