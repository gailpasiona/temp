@extends('templates.master')

@section('nav')
@include('templates.nav.nav_public',array('user' => $user))
@stop
@section('sub_nav')
@include('templates.nav.user_menu')
@stop


@section('content')
<div class="page">
  <div class="container">
      <div class="col-md-12">
         <div class="messages"></div>
          <div class="panel panel-default">
            <div class="panel-heading"><i class="fa fa-qrcode fa-md"></i> <strong>Open Invoices</strong></div>
           
                 <div class="panel-table"><table id="table-purchases" class="table"></table></div>
            
                 
                  <div class="panel-footer clearfix">

        <div class="pull-right">
            <!-- <div class="controls">
            <select class="form-control" name="type" id="type">
                     <option value="">Default</option>
                     <option value="">All Purchases</option>
            </select>
        	<button type="button" class="btn btn-md btn-success" onclick="refreshTable();"><i class="fa fa-refresh fa-lg"></i>&nbsp;<strong>Refresh Table</strong></button>
        </div> -->
            <!-- <a href="{{ route('user_form')}}" class="btn btn-warning" data-toggle="modal" data-target="#users_modal">Create New</a> -->
            <form class="form-inline">
              <div class="control-group">
                <!-- <label class="control-label">Reload Table:</label> -->
                <div class="controls">
                  <select class="form-control" id="reload_type">
                            <option value="">Posted Invoices </option>
                            <option value="open">Open Invoices </option>
                            <option value="all">All Invoices </option>
                    </select>
                 <button type="button" class="btn btn-md btn-success" onclick="refreshTable();"><i class="fa fa-refresh fa-lg"></i>&nbsp;<strong>Refresh Table</strong></button>
                </div>
              </div>
            </form>
        </div>

    </div>
          
          </div>
      </div>

  </div>

  <div class="modal fade" data-backdrop="static" id="modal_form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
</div>
@stop


@section('styles')
<link rel="stylesheet" href="{{ URL::asset('css/bootstrap-table.css')}}" />
<link rel="stylesheet" href="{{ URL::asset('css/datepicker.css')}}" />
@stop
@section('scripts')
<script src="{{ URL::asset('js/accounting.js')}}"></script>
<script src="{{ URL::asset('js/bootstrap-table.js')}}"></script>
<script src="{{ URL::asset('js/processing.js')}}"></script>
<script src="{{ URL::asset('js/datepicker.js')}}"></script>
<script>

$('#table-purchases').bootstrapTable({
                        url: "aging",
                        queryParams: function query(params)
                                    {
                                        var q = {
                                            "limit": params.pageSize,
                                            "offset": params.pageSize * (params.pageNumber - 1),
                                            "search": params.searchText,
                                            //
                                            "type" : $("#reload_type").val(),
                                            //
                                            "name": params.sortName,
                                            "order": params.sortOrder
                                        };
                     
                                        return q;
                                    },
                        // showRefresh: true,
                        //showColumns: true,
                        // search: true,
                       //    showToggle: true,
                        pagination: true,
                        columns: [{
                            field: 'register_id',
                            title: 'Invoice No',
                            align: 'left',
                            valign: 'center',
                            sortable: true,
                            // width: 200/2,
                        },{
                            field: 'created_at',
                            title: 'Invoice Date',
                            align: 'left',
                            valign: 'canter',
                            sortable: 'false',
                             // width: 200/2,
                        },{
                            field: 'register_refno',
                            title: 'Reference No',
                            align: 'left',
                            valign: 'center',
                            sortable: true,
                            // width: 200/5,
                        }, {
                            field: 'account_value',
                            title: 'Amount',
                            align: 'left',
                            valign: 'center',
                            formatter: amountFormatter,
                            //valign: 'bottom',
                            // width: 200/5,
                            sortable: true
                        }, {
                            field: 'reference',
                            title: 'Supplier',
                            align: 'left',
                            valign: 'center',
                            //valign: 'bottom',
                            // width: 200/5,
                            formatter: json2string,
                            sortable: false
                        },{
                            field: 'register_id',
                            title: 'Action',
                            align: 'center',
                            valign: 'center',
                            //valign: 'bottom',
                            //width: 200/3,
                            formatter: useractionFormatter,
                            sortable: false
                        }]});
function json2string(obj){
    // var object =  obj.supplier;
    return obj.supplier.supplier_name;
}
function amountFormatter(value){
    return accounting.formatMoney(value,"Php ");;
}
function useractionFormatter(value,row){
    // return '<button type="button" class="btn btn-sm btn-warning syncBtn" onclick="invoice_action(\'' + value + '\');"><strong>Request Payment</strong></button>';
    var url = "";
    // console.log(value, row.rfp);
    if(row.register_post == 'Y'){
        if(row.rfp){
            return '<strong>Payment Requested</strong>';
        }

        else{
            url = "rfp/create?invoice=" + encodeURIComponent(value);
            return '<a class="btn btn-sm btn-warning" href="'+ url +'" data-toggle="modal" data-target="#modal_form"><strong>Request Payment</strong></a>';
        }
        
    }
    else{
         url = 'invoice/' + encodeURIComponent(value) + '/edit';
        var posturl = 'invoice/post/' + encodeURIComponent(value);
        // return '<a class="btn btn-sm btn-success" href="'+ url +'">Post Invoice</a>';
        return '<a class="btn btn-sm btn-warning" href="'+ url +'" data-toggle="modal" data-target="#modal_form"><strong>Edit</strong></a>&nbsp;' + 

          '<a class="btn btn-sm btn-warning" href="'+ posturl +'" data-toggle="modal" data-target="#modal_form"><strong>Post</strong></a>';
        // '<button type="button" class="btn btn-sm btn-success" onclick="invoice_action(\'' + value + '\');"><strong>Post</strong></button>';
    }
        
}
function refreshTable(){
	$('#table-purchases').bootstrapTable('refresh',{});
}
function invoice_action(value){
    console.log(value);
    myApp.showPleaseWait();
    var request = $.ajax({
       url: 'invoice/posting',
        type: "POST",
        data: {invoice: value},
            //dataType: "json"
    });
            
    request.done(function(data){
    myApp.hidePleaseWait();
    $('.table').bootstrapTable('refresh');
    show_message_in_parent(data);
    // $('#table-records').bootstrapTable('refresh',{url: 'bp_records'});

    });
    request.fail(function(jqXHR, textStatus){
     myApp.hidePleaseWait();
     $(".messages").append('<div class="message_content alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert">\n\
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>\n\
                    <strong>Transaction Succeeded!</strong> <br />System Error, please contact your System Administrator </div>');
    });
}
function edit_action(value){
    console.log(value);
    myApp.showPleaseWait();
    var request = $.ajax({
    url: 'invoice/' + encodeURIComponent(value) + '/edit',
        type: "GET"
        // data: {invoice: value},
            //dataType: "json"
    });
            
    request.done(function(data){
    myApp.hidePleaseWait();
    $('.table').bootstrapTable('refresh');
    // $('#table-records').bootstrapTable('refresh',{url: 'bp_records'});

    });
    request.fail(function(jqXHR, textStatus){
     myApp.hidePleaseWait();
    });
}

function show_message_in_parent(data){
           // console.log(data);
            $("div").removeClass("has-error");
            $( ".message_content" ).remove();//remove first if exists
             var prompt = "<br />";

             if(data.status == 'success_error'){
                $.each(data.message, function(key,value) {
                    prompt += value + "<br />";
                    $('.' + key).addClass("has-error");
                 });
                 $(".messages").append('<div class="message_content alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert">\n\
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>\n\
                    <strong>Errors Occured!</strong> '+prompt+' </div>');
             }
             else if(data.status == 'success_failed'){
                  $(".messages").append('<div class="message_content alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert">\n\
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>\n\
                    <strong>Transaction Succeeded!</strong> <br />'+data.message+' </div>');
             }
             else{
                  $(".messages").append('<div class="message_content alert alert-success alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert">\n\
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>\n\
                    <strong>Transaction Succeeded!</strong> <br />'+data.message+' </div>');
             }
             
      }

$('.modal').on('hidden.bs.modal', function () {
 $(this).removeData('bs.modal');
  $('.table').bootstrapTable('refresh');
  $(this).empty();
});
</script>
@stop
