
#from selenium.remote.webdriver import WebDriver

#driver = WebDriver("http://172.16.205.129:4444", "firefox", "ANY")
#driver.get('http://google.com')
#driver.quit()

from selenium import webdriver
from selenium.common.exceptions import * #NoSuchElementException
from selenium.webdriver.common.keys import Keys
import time
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

#browser = WebDriver("http://172.16.205.129:4444", "firefox", "ANY")
browser = webdriver.Remote(
   command_executor='http://127.0.0.1:4444/wd/hub',
      desired_capabilities=DesiredCapabilities.CHROME)
#driver.get('http://google.com')
#driver.quit()
#browser = webdriver.Firefox() # Get local session of firefox
browser.set_page_load_timeout(10)
with open("file.txt", "r") as ins:
    for line in ins:
        print line
        try:
            browser.get("http://" + line)
            time.sleep(10)
            browser.switch_to_alert().accept();
        except TimeoutException:
            print line + " timed out"
        except NoAlertPresentException:
            pass
        browser.delete_all_cookies()
#time.sleep(1)
#browser.switch_to_alert().accept()
#time.sleep(5)
#browser.get("http://nsm.stat.no")
#browser.get("http://www.yahoo.com") # Load page
#assert "Yahoo" in browser.title
#elem = browser.find_element_by_name("p") # Find the query box
#elem.send_keys("seleniumhq" + Keys.RETURN)
#time.sleep(0.2) # Let the page load, will be added to the API
#try:
#    browser.find_element_by_xpath("//a[contains(@href,'http://seleniumhq.org')]")
#except NoSuchElementException:
#    print "can't find seleniumhq"
#time.sleep(5)
browser.close()
