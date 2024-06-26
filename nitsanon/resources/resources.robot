*** Settings ***
Documentation   A resource file for some data in NITSANON portal
Library         SeleniumLibrary
Library         Collections

*** Variables ***
${URL}              http://nitsanon.epizy.com/

${C_USERNAME}       nitin
${C_PASSWORD}       kumar
${IC_USERNAME}     nitinkr
${IC_PASSWORD}     kumarnit

${USERNAME_TEXTBOX}     id=username
${PASSWORD_TEXTBOX}     id=password
${LOGIN_BTN}            name=login
${STORIES}              class=alert
${DELETE_BTN}           class=btn-danger
${DATE_OF_POST}         class=label

${EXPECTED_TITLE}   NITSANON

#@{expected_DATE_OF_POST} =      Create List     2024-04-01 05:31:23     2024-04-01 05:31:10     2023-09-04 05:36:41     2023-08-13 01:04:28     2023-02-18 02:16:58

*** Keywords ***

open the browser and navigate to NITSANON portal
    Open Browser    ${URL}    Chrome

