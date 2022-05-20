import os
import requests
import json
from configparser import ConfigParser

source_agent = "San Jose, CA (AWS us-west-1)"
target_agents = [
    'London, England (AWS eu-west-2)',
    'Paris, France (AWS eu-west-3)',
    'Columbus, OH (AWS us-east-2)',
    'Ashburn, VA (AWS us-east-1)',
    'Sydney, Australia (AWS ap-southeast-2)',
    'Frankfurt, Germany (AWS eu-central-1)'
]
token = "b20651c3-6754-46bd-adb1-e87ca6a0a25b"  # OAuth Bearer Token
baseUrl = "https://api.thousandeyes.com/v6"
interval = "900"

os.system('clear')


def main():
    filtered_target_agents = {"agents": []}
    header = {
        "Authorization": "Bearer " + token,
        "Content-Type": "application/json",
        "Accept": "application/json"}
    response = requests.get(
        url=baseUrl +
        '/agents.json?agentTypes=CLOUD',
        headers=header)
    agents = response.json()
    filtered_source_agent = [
        x for x in agents['agents'] if x['agentName'] == source_agent]
    for target_agent in target_agents:
        filtered_target_agents['agents'].append(
            [x for x in agents['agents'] if x['agentName'] == target_agent])
    create_tests(header, filtered_source_agent, filtered_target_agents)


def create_tests(headers, source_agent, target_agents):
    payload = {"interval": interval, "agents": [
        {"agentId": source_agent[0]['agentId']}], "alertsEnabled": 0}
    for agents in target_agents["agents"]:
        for target_agent in agents:
            payload["testName"] = 'Agent2Agent Test (' + source_agent[0]['location'] + \
                ' -> ' + target_agent['location'] + ')'
            payload["targetAgentId"] = target_agent['agentId']
            json_object = json.dumps(payload)
            response = requests.post(
                url=baseUrl +
                "/tests/agent-to-agent/new.json",
                headers=headers,
                data=json_object)
            parsedOutput = response.json()
            testID = parsedOutput['test'][0]['testId']
            testNAME = parsedOutput['test'][0]['testName']
            print(
                "Test ID: " +
                str(testID) +
                " | " +
                "Test Name: " +
                str(testNAME))


if __name__ == '__main__':
    main()
