resource "aws_sns_topic" "alerts" {
  name = "3tier-alerts"
}


resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "3tier-monitoring"
  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric",
        x      = 0,
        y      = 0,
        width  = 12,
        height = 6,
        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "AutoScalingGroupName", var.asg_name],
            ["AWS/RDS", "CPUUtilization", "DBInstanceIdentifier", var.db_identifier],
            ["AWS/EC2", "DiskReadOps", "AutoScalingGroupName", var.asg_name],
            ["AWS/EC2", "DiskWriteOps", "AutoScalingGroupName", var.asg_name]
          ],
          view   = "timeSeries",
          stacked = false,
          region = var.aws_region,
          title  = "Compute & Database Metrics"
        }
      }
    ]
  })
}