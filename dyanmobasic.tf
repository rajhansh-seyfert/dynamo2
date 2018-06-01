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
  
   global_secondary_index {
    name               = "joining_dateIndex"
    hash_key           = "joining_date"
    range_key          = "joining_date"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["EmployeeId"]
  }


  tags {
    Name        = "Seyfert"
    Environment = "production"
  }
}
