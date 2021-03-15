#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from '@aws-cdk/core';
import { ServerlessChatbotStack } from '../lib/serverless-chatbot-stack';

const app = new cdk.App();
new ServerlessChatbotStack(app, 'ServerlessChatbotStack');
