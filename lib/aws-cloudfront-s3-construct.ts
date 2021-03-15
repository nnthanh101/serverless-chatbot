import { Construct }      from '@aws-cdk/core';
import { Bucket }         from '@aws-cdk/aws-s3';
import { CloudFrontToS3 } from '@aws-solutions-constructs/aws-cloudfront-s3';

export class CloudfrontStaticWebsite extends Construct {
  private readonly _webclient:  Bucket | undefined;
  private readonly _domainName: string;
  private readonly _bucketName: any;

  constructor(scope: Construct, id: string) {
    super(scope, id);

    const cloudfrontToS3 = new CloudFrontToS3(this, 'CloudFrontToS3', {
      insertHttpSecurityHeaders: false,
    });

    this._webclient  = cloudfrontToS3.s3Bucket;
    this._domainName = `https://${cloudfrontToS3.cloudFrontWebDistribution.domainName}`;
    this._bucketName = cloudfrontToS3.s3Bucket?.bucketName;
  }

  public get webclient(): Bucket | undefined {
    return this._webclient;
  }

  public get domainName(): string {
    return this._domainName;
  }

  public get bucketName(): string {
    return this._bucketName.toString();
  }
}
