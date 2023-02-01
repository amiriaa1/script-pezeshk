 <?php $__env->startSection('content'); ?>
<?php if(session()->has('message')): ?>
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('message')); ?></div> 
<?php endif; ?>
<?php if(session()->has('not_permitted')): ?>
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div> 
<?php endif; ?>

<section>
    <div class="container-fluid">
        <?php if(in_array("transfers-add", $all_permission)): ?>
            <a href="<?php echo e(route('transfers.create')); ?>" class="btn btn-info"><i class="dripicons-plus"></i> <?php echo e(trans('file.add')); ?> <?php echo e(trans('file.Transfer')); ?></a>
            <a href="<?php echo e(url('transfers/transfer_by_csv')); ?>" class="btn btn-primary"><i class="dripicons-copy"></i> <?php echo e(trans('file.import')); ?> <?php echo e(trans('file.Transfer')); ?></a>
        <?php endif; ?>
    </div>
    <div class="table-responsive">
        <table id="transfer-table" class="table transfer-list">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th><?php echo e(trans('file.Date')); ?></th>
                    <th><?php echo e(trans('file.reference')); ?> شماره</th>
                    <th><?php echo e(trans('file.Warehouse')); ?>(<?php echo e(trans('file.From')); ?>)</th>
                    <th><?php echo e(trans('file.Warehouse')); ?>(<?php echo e(trans('file.To')); ?>)</th>
                    <th><?php echo e(trans('file.product')); ?> <?php echo e(trans('file.Cost')); ?></th>
                    <th><?php echo e(trans('file.product')); ?> <?php echo e(trans('file.Tax')); ?></th>
                    <th><?php echo e(trans('file.grand total')); ?></th>
                    <th><?php echo e(trans("file.Status")); ?></th>
                    <th class="not-exported"><?php echo e(trans('file.action')); ?></th>
                </tr>
            </thead>
            <tbody>
                
                
                <?php


	


	function gregorian_to_jalali($gy, $gm, $gd, $mod='') {
	  $g_d_m = array(0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334);
	  $gy2 = ($gm > 2)? ($gy + 1) : $gy;
	  $days = 355666 + (365 * $gy) + ((int)(($gy2 + 3) / 4)) - ((int)(($gy2 + 99) / 100)) + ((int)(($gy2 + 399) / 400)) + $gd + $g_d_m[$gm - 1];
	  $jy = -1595 + (33 * ((int)($days / 12053)));
	  $days %= 12053;
	  $jy += 4 * ((int)($days / 1461));
	  $days %= 1461;
	  if ($days > 365) {
		$jy += (int)(($days - 1) / 365);
		$days = ($days - 1) % 365;
	  }
	  if ($days < 186) {
		$jm = 1 + (int)($days / 31);
		$jd = 1 + ($days % 31);
	  } else{
		$jm = 7 + (int)(($days - 186) / 30);
		$jd = 1 + (($days - 186) % 30);
	  }
	  return ($mod == '')? array($jy, $jm, $jd) : $jy.$mod.$jm.$mod.$jd;
	}
?>




                <?php $__currentLoopData = $lims_transfer_all; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$transfer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php                     
                    if($transfer->status == 1)
                        $status = trans('file.Completed');
                    elseif($transfer->status == 2)
                        $status = trans('file.Pending');
                    elseif($transfer->status == 3)
                        $status = trans('file.Sent');
                ?>
                <tr class="transfer-link" data-transfer='["<?php echo e(date($general_setting->date_format, strtotime($transfer->created_at->toDateString()))); ?>", "<?php echo e($transfer->reference_no); ?>", "<?php echo e($status); ?>", "<?php echo e($transfer->id); ?>", "<?php echo e($transfer->fromWarehouse->name); ?>", "<?php echo e($transfer->fromWarehouse->phone); ?>", "<?php echo e($transfer->fromWarehouse->address); ?>", "<?php echo e($transfer->toWarehouse->name); ?>", "<?php echo e($transfer->toWarehouse->phone); ?>", "<?php echo e($transfer->toWarehouse->address); ?>", "<?php echo e($transfer->total_tax); ?>", "<?php echo e($transfer->total_cost); ?>", "<?php echo e($transfer->shipping_cost); ?>", "<?php echo e($transfer->grand_total); ?>", "<?php echo e($transfer->note); ?>", "<?php echo e($transfer->user->name); ?>", "<?php echo e($transfer->user->email); ?>"]'>
                    <td><?php echo e($key); ?></td>
                    
                    
                    
                    <td>
                        
                        <?php
                         
                        	date_default_timezone_set('Asia/Tehran');


	             	list($gy, $gm, $gd) = explode('-', ($transfer->created_at->toDateString()));


	               	$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //خروجی آرایه
	               	$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته

                       echo $j_date_string;
                        ?>
                        
                        <?php echo e(' '. $transfer->created_at->toTimeString()); ?>

                        
                        
                        </td>
                   
                   
                   
                   
                    <td><?php echo e($transfer->reference_no); ?></td>
                    <td><?php echo e($transfer->fromWarehouse->name); ?></td>
                    <td><?php echo e($transfer->toWarehouse->name); ?></td>
                    <td class="total-cost"><?php echo e($transfer->total_cost); ?> <?php echo config('currency'); ?></td>
                    <td class="total-tax"><?php echo e($transfer->total_tax); ?></td>
                    <td class="grand-total"><?php echo e($transfer->grand_total); ?> <?php echo config('currency'); ?> </td>
                    <?php if($transfer->status == 1): ?>
                        <td><div class="badge badge-success"><?php echo e($status); ?></div></td>
                    <?php elseif($transfer->status == 2): ?>
                        <td><div class="badge badge-danger"><?php echo e($status); ?></div></td>
                    <?php else: ?>
                        <td><div class="badge badge-warning"><?php echo e($status); ?></div></td>
                    <?php endif; ?>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo e(trans('file.action')); ?><span class="caret"></span><span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" class="btn btn-link view"><i class="fa fa-eye"></i> <?php echo e(trans('file.View')); ?></button>
                                </li>
                                <?php if(in_array("transfers-edit", $all_permission)): ?>
                                <li>
                                    <a href="<?php echo e(route('transfers.edit', $transfer->id)); ?>" class="btn btn-link"><i class="dripicons-document-edit"></i> <?php echo e(trans('file.edit')); ?></a> 
                                </li>
                                <?php endif; ?>
                                <li class="divider"></li>
                                <?php if(in_array("transfers-delete", $all_permission)): ?>
                                <?php echo e(Form::open(['route' => ['transfers.destroy', $transfer->id], 'method' => 'DELETE'] )); ?>

                                <li>
                                    <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> <?php echo e(trans('file.delete')); ?></button>
                                </li>
                                <?php echo e(Form::close()); ?>

                                <?php endif; ?>
                            </ul>
                        </div>
                    </td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
            <tfoot class="tfoot active">
                <th></th>
                <th><?php echo e(trans('file.Total')); ?></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tfoot>
        </table>
    </div>
</section>

<div id="transfer-details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        <div class="container mt-3 pb-2 border-bottom">
            <div class="row">
                <div class="col-md-3">
                    <button id="print-btn" type="button" class="btn btn-default btn-sm d-print-none"><i class="dripicons-print"></i> <?php echo e(trans('file.Print')); ?></button>
                </div>
                <div class="col-md-6">
                    <h3 id="exampleModalLabel" class="modal-title text-center container-fluid"><?php echo e($general_setting->site_title); ?></h3>
                </div>
                <div class="col-md-3">
                    <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close" class="close d-print-none"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="col-md-12 text-center">
                    <i style="font-size: 15px;"><?php echo e(trans('file.Transfer Details')); ?></i>
                </div>
            </div>
        </div>
            <div id="transfer-content" class="modal-body">
            </div>
            <br>
            <table class="table table-bordered product-transfer-list">
                <thead>
                    <th>#</th>
                    <th><?php echo e(trans('file.product')); ?></th>
                    <th>تعداد</th>
                    <th><?php echo e(trans('file.Unit Cost')); ?></th>
                    <th><?php echo e(trans('file.Tax')); ?></th>
                    <th><?php echo e(trans('file.Subtotal')); ?></th>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div id="transfer-footer" class="modal-body"></div>
      </div>
    </div>
</div>

<script type="text/javascript">
    $("ul#transfer").siblings('a').attr('aria-expanded','true');
    $("ul#transfer").addClass("show");
    $("ul#transfer #transfer-list-menu").addClass("active");

    var all_permission = <?php echo json_encode($all_permission) ?>;
    var transfer_id = [];
    var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;
    
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function confirmDelete() {
        if (confirm("آیا مطمئن هستید که می خواهید حذف کنید؟")) {
            return true;
        }
        return false;
    }

    $("tr.transfer-link td:not(:first-child, :last-child)").on("click", function(){
        var transfer = $(this).parent().data('transfer');
        transferDetails(transfer);
    });

    $(".view").on("click", function(){
        var transfer = $(this).parent().parent().parent().parent().parent().data('transfer');
        transferDetails(transfer);
    });

    $("#print-btn").on("click", function(){
          var divToPrint=document.getElementById('transfer-details');
          var newWin=window.open('','Print-Window');
          newWin.document.open();
          newWin.document.write('<link rel="stylesheet" href="<?php echo asset('public/vendor/bootstrap/css/bootstrap.min.css') ?>" type="text/css"><style type="text/css">@media  print {.modal-dialog { max-width: 1000px;} }</style><body onload="window.print()">'+divToPrint.innerHTML+'</body>');
          newWin.document.close();
          setTimeout(function(){newWin.close();},10);
    });

    $('#transfer-table').DataTable( {
        "order": [],
        'language': {
            'lengthMenu': '_MENU_ <?php echo e(trans("file.records per page")); ?>',
             "info":      '<small><?php echo e(trans("file.Showing")); ?> _START_ - _END_ (_TOTAL_)</small>',
            "search":  '<?php echo e(trans("file.Search")); ?>',
            'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
            }
        },
        'columnDefs': [
            {
                "orderable": false,
                'targets': [0, 9]
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        buttons: [
          
            {
                extend: 'print',
                text: '<?php echo e(trans("file.Print")); ?>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                text: '<?php echo e(trans("file.delete")); ?>',
                className: 'buttons-delete',
                action: function ( e, dt, node, config ) {
                    if(user_verified == '1') {
                        transfer_id.length = 0;
                        $(':checkbox:checked').each(function(i){
                            if(i){
                                var transfer = $(this).closest('tr').data('transfer');
                                transfer_id[i-1] = transfer[3];
                            }
                        });
                        if(transfer_id.length && confirm("آیا مطمئن هستید که می خواهید حذف کنید؟")) {
                            $.ajax({
                                type:'POST',
                                url:'transfers/deletebyselection',
                                data:{
                                    transferIdArray: transfer_id
                                },
                                success:function(data){
                                    alert(data);
                                }
                            });
                            dt.rows({ page: 'current', selected: true }).remove().draw(false);
                        }
                        else if(!transfer_id.length)
                            alert('Nothing is selected!');
                    }
                    else
                        alert('This feature is disable for demo!');
                }
            },
            {
                extend: 'colvis',
                text: '<?php echo e(trans("file.Column visibility")); ?>',
                columns: ':gt(0)'
            },
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum(api, false);
        }
    } );

    function datatable_sum(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 5 ).footer() ).html(dt_selector.cells( rows, 5, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 7 ).footer() ).html(dt_selector.cells( rows, 7, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 5 ).footer() ).html(dt_selector.cells( rows, 5, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 7 ).footer() ).html(dt_selector.cells( rows, 7, { page: 'current' } ).data().sum().toFixed(2));
        }
    }

    function transferDetails(transfer) {
        var htmltext = '<strong><?php echo e(trans("file.reference")); ?>: </strong>'+transfer[1]+'<br><strong> <?php echo e(trans("file.Transfer")); ?> <?php echo e(trans("file.Status")); ?>: </strong>'+transfer[2]+'<br><br><div class="row"><div class="col-md-6"><strong><?php echo e(trans("file.From")); ?>:</strong><br>'+transfer[4]+'<br>'+transfer[5]+'<br>'+transfer[6]+'</div><div class="col-md-6"><div class="float-right"><strong><?php echo e(trans("file.To")); ?>:</strong><br>'+transfer[7]+'<br>'+transfer[8]+'<br>'+transfer[9]+'</div></div></div>';

        $.get('transfers/product_transfer/' + transfer[3], function(data) {
            $(".product-transfer-list tbody").remove();
            var name_code = data[0];
            var qty = data[1];
            var unit_code = data[2];
            var tax = data[3];
            var tax_rate = data[4];
            var subtotal = data[5];
            var newBody = $("<tbody>");
            $.each(name_code, function(index) {
                var newRow = $("<tr>");
                var cols = '';
                cols += '<td><strong>' + (index+1) + '</strong></td>';
                cols += '<td>' + name_code[index] + '</td>';
                cols += '<td>' + qty[index] + ' ' + unit_code[index] + '</td>';
                cols += '<td>' + (subtotal[index] / qty[index]) + '</td>';
                cols += '<td>' + tax[index] + '(' + tax_rate[index] + '%)' + '</td>';
                cols += '<td>' + subtotal[index] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);
            });

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=4><strong><?php echo e(trans("file.Total")); ?>:</strong></td>';
            cols += '<td>' + transfer[10] + '</td>';
            cols += '<td>' + transfer[11] + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=5><strong><?php echo e(trans("file.Shipping Cost")); ?>:</strong></td>';
            cols += '<td>' + transfer[12] + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=5><strong><?php echo e(trans("file.grand total")); ?>:</strong></td>';
            cols += '<td>' + transfer[13] + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

             $("table.product-transfer-list").append(newBody);
        });

        var htmlfooter = '<p><strong><?php echo e(trans("file.Note")); ?>:</strong> '+transfer[14]+'</p><strong><?php echo e(trans("file.Created By")); ?>:</strong><br>'+transfer[15]+'<br>'+transfer[16];

        $('#transfer-content').html(htmltext);
        $('#transfer-footer').html(htmlfooter);
        $('#transfer-details').modal('show');
    }

    if(all_permission.indexOf("transfers-delete") == -1)
        $('.buttons-delete').addClass('d-none');
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/edomeir/public_html/salepro/resources/views/transfer/index.blade.php ENDPATH**/ ?>