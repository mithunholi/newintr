<script>document.title = 'Dashboard';</script>
<!-- Morris charts -->
<link
	href="${pageContext.request.contextPath}/resources/plugins/morris/morris.css"
	rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/resources/plugins/morris/raphael.js" type="text/javascript"></script>
<script>document.title = 'Dashboard';</script>
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>Dashboard</h1>
	<ol class="breadcrumb">
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<!-- Small boxes (Stat box) -->
	<div class="row">
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-aqua">
				<div class="inner">
					<h3>937543</h3>
					<p>Number of Advertisers</p>
				</div>
				<div class="icon">
					<i class="ion ion-person-stalker"></i>
				</div>
				<a href="" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-green">
				<div class="inner">
					<h3>
						56780<sup style="font-size: 20px"></sup>
					</h3>
					<p>Number of Device Owners</p>
				</div>
				<div class="icon">
					<i class="ion ion-person-stalker"></i>
				</div>
				<a href="" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>$ 12497</h3>
					<p>Total Campaign Budget</p>
				</div>
				<div class="icon">
					<i class="ion ion-social-usd"></i>
				</div>
				<a href="" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-red">
				<div class="inner">
					<h3>594513 / 6832</h3>
					<p>Number of Impressions & Devices</p>
				</div>
				<div class="icon">
					<i class="ion ion-thumbsup"></i>
				</div>
				<a href="" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
	</div>
	<!-- /.row -->
	<!-- Main row -->
	<div class="row">
		<div class="col-md-6">
			<!-- Number of New Advertisers -->
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">Number of New Advertisers</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body chart-responsive ">
					<div class="chart" id="bar-chart1" style="height: 300px;"></div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->

			<!-- Total campaign Budget -->
			<div class="box box-warning">
				<div class="box-header with-border">
					<h3 class="box-title">Total campaign Budget</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body chart-responsive ">
					<div class="chart" id="bar-chart3" style="height: 300px;"></div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->

		</div>
		<!-- /.col (LEFT) -->
		<div class="col-md-6">
			<!-- Number of New Device Owners -->
			<div class="box box-success">
				<div class="box-header with-border">
					<h3 class="box-title">Number of New Device Owners</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body chart-responsive ">
					<div class="chart" id="bar-chart2" style="height: 300px;"></div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->

			<!-- Number of Impressions & Devices -->
			<div class="box box-danger">
				<div class="box-header with-border">
					<h3 class="box-title">Number of Impressions & Devices</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body chart-responsive ">
					<div class="chart" id="bar-chart4" style="height: 300px;"></div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</div>
</section>
<!-- /.content -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/morris/morris.min.js"
	type="text/javascript"></script>
<script>
        $(function() {
        	console.log("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        	$('#search-term-form').attr("hidden","");
            //Number of New Advertisers
            var bar = new Morris.Bar({
              element: 'bar-chart1',
              resize: true,
              data: [
                {y: 'week-adsw', a: 3000},
                {y: 'week-2', a: 1550},
                {y: 'week-3', a: 1500},
                {y: 'week-4', a: 750},
                {y: 'week-5', a: 500}
              ],
              barColors: ['#00c0ef'],
              xkey: 'y',
              ykeys: ['a'],
              labels: ['Advertisers'],
              hideHover: 'auto'
            });
            //Total Campaign Budget 
            var bar = new Morris.Bar({
              element: 'bar-chart3',
              resize: true,
              data: [
                {y: 'week-1', a: 230},
                {y: 'week-2', a: 115},
                {y: 'week-3', a: 140},
                {y: 'week-4', a: 135},
                {y: 'week-5', a: 120}
              ],
              barColors: ['#f39c12'],
              xkey: 'y',
              ykeys: ['a'],
              labels: ['Budget $'],
              hideHover: 'auto'
            });
          });
      //Number of New Device Owners
        var bar = new Morris.Bar({
          element: 'bar-chart2',
          resize: true,
          data: [
            {y: 'week-1', a: 2030},
            {y: 'week-2', a: 1015},
            {y: 'week-3', a: 1040},
            {y: 'week-4', a: 1305},
            {y: 'week-5', a: 1200}
          ],
          barColors: ['#00a65a'],
          xkey: 'y',
          ykeys: ['a'],
          labels: ['Device Owners'],
          hideHover: 'auto'
        });
      //Number of Impressions & Devices
                 var bar = new Morris.Bar({
              element: 'bar-chart4',
              resize: true,
              data: [
                {y: 'week-1', a: 5000, b: 1000},
                {y: 'week-2', a: 3050, b: 1650},
                {y: 'week-3', a: 2500, b: 1400},
                {y: 'week-4', a: 4750, b: 2050},
                {y: 'week-5', a: 2500, b: 1450}
              ],
              barColors: ['#00a65a', '#f56954'],
              xkey: 'y',
              ykeys: ['a', 'b'],
              labels: ['Impression', 'Device'],
              hideHover: 'auto'
            });
        
</script>

