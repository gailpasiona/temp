<!-- <div id="navtop"> -->
<div class="subnavbar">

	<div class="subnavbar-inner">
	
		<div class="container">
			
			<a data-target=".subnav-collapse" data-toggle="collapse" class="subnav-toggle" href="javascript:;">
		      <span class="sr-only">Toggle navigation</span>
		      <i class="fa fa-gears"></i>
		      
		    </a>

			<div class="subnav-collapse in" style="height: auto;">
				<ul class="mainnav">
				
					<li>
						<a href="{{{ action('Financials\Controllers\TransactionController@index') }}}">
							<i class="fa fa-home"></i>
							<span>Dashboard</span>
						</a>	    				
					</li>

					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="javascript;;">
							<i class="fa fa-money"></i>
							<span>Accounts Payable</span>
						</a>
						<ul class="dropdown-menu">
				            <li><a href="{{{ action('Financials\Controllers\TransactionController@index_payables') }}}">Payables</a></li>
				            <li><a href="{{{ action('Financials\Controllers\APInvoiceController@index') }}}">Invoices</a></li>
				            <li><a href="{{{ action('Financials\Controllers\RFPController@index') }}}">Payment Requests</a></li>
				            <li><a href="{{{ action('Financials\Controllers\CVController@index') }}}">Cheque Voucher</a></li>
				          </ul>	   				
					</li>

					<li class="dropdown">
						<a href="#">
							<i class="fa fa-cube"></i>
							<span>Another Menu</span>
						</a>
					</li>
					
				</ul>
			</div> <!-- /.subnav-collapse -->

		</div> <!-- /container -->
	
	</div> <!-- /subnavbar-inner -->

</div>
</div>