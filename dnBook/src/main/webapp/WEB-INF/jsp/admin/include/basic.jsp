		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/datepicker3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Lumos-styles.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap-table.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/lumino.glyphs.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>	
		
		
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><span>DNBook</span>AdminPage</a>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div>
				
			</div>
		</form>
		<ul class="nav menu">
			<li class="active"><a href="${pageContext.request.contextPath}/admin/main.do"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg>Main</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/book/list.do"><svg class="glyph stroked calendar"><use xlink:href="#stroked-calendar"></use></svg> Book  </a></li>
			<li><a href=""><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> Sales </a></li>
			<li><a href=""><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> Member </a></li>
			<li><a href=""><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> Board </a></li>
			<li role="presentation" class="divider"></li>
			<li><a href="login.html"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Login Page</a></li>
		</ul>

	</div><!--/.sidebar-->