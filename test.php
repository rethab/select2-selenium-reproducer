<?php

require_once('php-webdriver/lib/__init__.php');

$driver = RemoteWebDriver::create('http://localhost:4444/wd/hub',DesiredCapabilities::firefox()); 

$driver->get(getenv('HOST').'/index.html');

$elem = $driver->findElement(WebDriverBy::cssSelector('#s2id_e1 .select2-choice'));
$elem->click();

$searchbox = "#select2-drop:not([style*='display: none'])";
$inputbox = $searchbox . " .select2-input ";
$submitselector = " .select2-results li.select2-result-selectable";

$input = $driver->findElement(WebDriverBy::cssSelector($inputbox));
$input->sendKeys('Thurgau (Schweiz)');
$driver->wait(999, 10000)->until(WebDriverExpectedCondition::titleIs('I will never actually be the title'));

