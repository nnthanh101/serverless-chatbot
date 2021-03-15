import { Construct, Stack, StackProps } from '@aws-cdk/core';

export interface ServerlessChatbotStackProps extends StackProps {
  readonly solutionID:   string;
  readonly solutionName: string;
}

/**
 * 
 */
export class ServerlessChatbotStack extends Stack {
  constructor(scope: Construct, id: string, props: ServerlessChatbotStackProps) {
    super(scope, id, props);

    // The code that defines your stack goes here
    

  }
}
