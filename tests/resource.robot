# .robot file >> resource file >>
# declare keywords under

*** Settings ***
Documentation   A reosurce file with reusable keywords and variables
Library         SeleniumLibrary

*** Variables ***
${USERNAME}     nitinkr
${PASSWORD}     kumarnit

*** Keywords ***

open the browser with the mortgage payment url
    Open Browser    ${URL}    Chrome


