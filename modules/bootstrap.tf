# build an S3 bucket as backend to store tf state file
resource "aws_s3_bucket" "state_bucket" {
    bucket=var.name_of_s3_bucket
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AE256"
            }
        }
    }
    # enable AWS to retain version history of state file
    versioning {
        enabled=true
    }

    #safety measure - prevents TF from destorying this object
    lifecycle {
        prevent_destroy=true
    }

    tags {
        Terraform="true"
    }
}
