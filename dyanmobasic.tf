resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "Seyfert"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "EmployeeId"
  range_key      = "joining_date"

  attribute {
    name = "EmployeeId"
    type = "S"
  }

  attribute {
    name = "joining_date"
    type = "S"
  }


  ttl {
    attribute_name = "TimeToExist"
    enabled = false
  }

  tags {
    Name        = "Seyfert"
    Environment = "production"
  }
}
