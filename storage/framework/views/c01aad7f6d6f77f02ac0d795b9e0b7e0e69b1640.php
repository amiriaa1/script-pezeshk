 <?php $__env->startSection('content'); ?>
<section class="forms">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header mt-2">
                <h3 class="text-center"><?php echo e(trans('file.Customer Report')); ?></h3>
            </div>
          
        </div>
    </div>
    <ul class="nav nav-tabs ml-4 mt-3" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#customer-sale" role="tab" data-toggle="tab"><?php echo e(trans('file.Sale')); ?></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#customer-payments" role="tab" data-toggle="tab"><?php echo e(trans('file.Payment')); ?></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#customer-quotation" role="tab" data-toggle="tab"><?php echo e(trans('file.Quotation')); ?></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#customer-return" role="tab" data-toggle="tab"><?php echo e(trans('file.return')); ?></a>
      </li>
    </ul>

    <div class="tab-content">

        <div role="tabpanel" class="tab-pane fade show active" id="customer-sale">
            <div class="table-responsive mb-4">
                <table id="sale-table" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="not-exported-sale"></th>
                            <th><?php echo e(trans('file.Date')); ?></th>
                            <th><?php echo e(trans('file.reference')); ?> </th>
                            <th><?php echo e(trans('file.Warehouse')); ?></th>
                            <th><?php echo e(trans('file.product')); ?> (<?php echo e(trans('file.qty')); ?>)</th>
                            <th><?php echo e(trans('file.grand total')); ?></th>
                            <th><?php echo e(trans('file.Paid')); ?></th>
                            <th><?php echo e(trans('file.Due')); ?></th>
                            <th><?php echo e(trans('file.Status')); ?></th>
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
                        
                        <?php $__currentLoopData = $lims_sale_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$sale): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td><?php echo e($key); ?></td>
                            
                            <td>
                            
                            
                                        
                                          <?php
                            $iran=date($general_setting->date_format, strtotime($sale->created_at->toDateString()));
                        
                 
		list($gy, $gm, $gd) = explode('/', ($iran));
		$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //?????????? ??????????
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //?????????? ????????
                            echo $j_date_string.''.$sale->created_at->toTimeString()
                            ?>
                
                            
                            </td>
                            <td><?php echo e($sale->reference_no); ?></td>
                            <td><?php echo e($sale->warehouse->name); ?></td>
                            <td>
                                <?php $__currentLoopData = $lims_product_sale_data[$key]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product_sale_data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php 
                                    $product = App\Product::select('name')->find($product_sale_data->product_id);
                                    if($product_sale_data->variant_id) {
                                        $variant = App\Variant::find($product_sale_data->variant_id);
                                        $product->name .= ' ['.$variant->name.']'; 
                                    }
                                    $unit = App\Unit::find($product_sale_data->sale_unit_id);
                                ?>
                                <?php if($unit): ?>
                                    <?php echo e($product->name.' ('.$product_sale_data->qty.' '.$unit->unit_code.')'); ?>

                                <?php else: ?>
                                    <?php echo e($product->name.' ('.$product_sale_data->qty.')'); ?>

                                <?php endif; ?>
                                <br>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </td>
                            <td>
                            
                            
                            
                                   <?php
                                     $iran=number_format(($sale->grand_total), 2);
                                echo    $iran2=substr($iran, 0, -3) .''. config('currency'); 
                            ?>
                            </td>
                            <td>
                            
                            
                                <?php
                                     $iran=number_format(($sale->paid_amount), 2);
                                echo    $iran2=substr($iran, 0, -3) .''. config('currency'); 
                            ?>
                            
                            
                            
                            
                            
                            </td>
                            <td>
                            
                            
                            
                                <?php
                                     $iran=number_format(($sale->grand_total - $sale->paid_amount), 2);
                                echo    $iran2=substr($iran, 0, -3) .''. config('currency'); 
                            ?>
                            
                            
                            </td>
                            <?php if($sale->sale_status == 1): ?>
                            <td><div class="badge badge-success"><?php echo e(trans('file.Completed')); ?></div></td>
                            <?php else: ?>
                            <td><div class="badge badge-danger"><?php echo e(trans('file.Pending')); ?></div></td>
                            <?php endif; ?>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </tbody>
                    <tfoot class="tfoot active">
                        <tr>
                            <th></th>
                            <th>??????????:</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>0.0</th>
                            <th>0.0</th>
                            <th>0.0</th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane fade" id="customer-payments">
            <div class="table-responsive mb-4">
                <table id="payment-table" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="not-exported-payment"></th>
                            <th><?php echo e(trans('file.Date')); ?></th>
                            <th><?php echo e(trans('file.Payment Reference')); ?></th>
                            <th><?php echo e(trans('file.Sale Reference')); ?></th>
                            <th><?php echo e(trans('file.Amount')); ?></th>
                            <th><?php echo e(trans('file.Paid Method')); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $__currentLoopData = $lims_payment_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$payment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr>
                                <td><?php echo e($key); ?></td>
                                <td>
                                
                                
                                                   
                                          <?php
                            $iran=date($general_setting->date_format, strtotime($payment->created_at));
                        
                 
		list($gy, $gm, $gd) = explode('/', ($iran));
		$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //?????????? ??????????
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //?????????? ????????
                            echo $j_date_string.''.$sale->created_at->toTimeString()
                            ?>
                                
                                
                                
                                </td>
                                <td><?php echo e($payment->payment_reference); ?></td>
                                <td><?php echo e($payment->sale_reference); ?></td>
                                <td>
                                
                                    <?php
                            
                            
                                     $iran=number_format($payment->amount, 2);
                                echo    $iran2=substr($iran, 0, -3) .''. config('currency'); 
                            
                            ?>
                                
                                
                                </td>
                                <td>
                                
                                
                                
                                
                                   <?php
                                if ($payment->paying_method =="Cheque") {
                                echo "????";

                                 }

 if ($payment->paying_method == "Cash") {
                                echo "????????";
 

                                 }
                                 
                                 
                                 
 if ($payment->paying_method == "Gift Card") {
                                echo "???????? ????????";
 

                                 }
                                  if ($payment->paying_method == "Credit Card") {
                                echo "???????? ??????????????";
 

                                 }
                                  ?>
                                
                                
                                </td>
                            </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </tbody>
                    <tfoot class="tfoot active">
                        <tr>
                            <th></th>
                            <th>??????????:</th>
                            <th></th>
                            <th></th>
                            <th>0.0</th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane fade" id="customer-return">
            <div class="table-responsive mb-4">
                <table id="return-table" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="not-exported-return"></th>
                            <th><?php echo e(trans('file.Date')); ?></th>
                            <th><?php echo e(trans('file.reference')); ?></th>
                            <th><?php echo e(trans('file.Warehouse')); ?></th>
                            <th><?php echo e(trans('file.Biller')); ?></th>
                            <th><?php echo e(trans('file.product')); ?> (<?php echo e(trans('file.qty')); ?>)</th>
                            <th><?php echo e(trans('file.grand total')); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $__currentLoopData = $lims_return_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$return): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td><?php echo e($key); ?></td>
                            <td>
                            
                            
                            
                                                  <?php
                            $iran=date($general_setting->date_format, strtotime($return->created_at->toDateString()));
                        
                 
		list($gy, $gm, $gd) = explode('/', ($iran));
		$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //?????????? ??????????
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //?????????? ????????
                            echo $j_date_string.''.$sale->created_at->toTimeString()
                            ?>
                            
                            
                            </td>
                            
                            
                            
                            
                            <td><?php echo e($return->reference_no); ?></td>
                            <td><?php echo e($return->warehouse->name); ?></td>
                            <td><?php echo e($return->biller->name); ?></td>
                            <td>
                                <?php $__currentLoopData = $lims_product_return_data[$key]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product_return_data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php 
                                    $product = App\Product::select('name')->find($product_return_data->product_id);
                                    if($product_return_data->variant_id) {
                                        $variant = App\Variant::find($product_return_data->variant_id);
                                        $product->name .= ' ['.$variant->name.']';
                                    }
                                    $unit = App\Unit::find($product_return_data->sale_unit_id);
                                ?>
                                <?php if($unit): ?>
                                    <?php echo e($product->name.' ('.$product_return_data->qty.' '.$unit->unit_code.')'); ?>

                                <?php else: ?>
                                    <?php echo e($product->name.' ('.$product_return_data->qty.')'); ?>

                                <?php endif; ?>
                                <br>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </td>
                            <td>
                            
                            
                                          <?php
                            
                            
                                     $iran=number_format((float)($return->grand_total), 2);
                                echo    $iran2=substr($iran, 0, -3) .''. config('currency'); 
                            
                            ?>
                            
                            
                            
                            
                            
                            </td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </tbody>
                    <tfoot class="tfoot active">
                        <tr>
                            <th></th>
                            <th>??????????:</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>0.0</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane fade" id="customer-quotation">
            <div class="table-responsive mb-4">
                <table id="quotation-table" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="not-exported-quotation"></th>
                            <th><?php echo e(trans('file.Date')); ?></th>
                            <th><?php echo e(trans('file.reference')); ?></th>
                            <th><?php echo e(trans('file.Warehouse')); ?></th>
                            <th><?php echo e(trans('file.Supplier')); ?></th>
                            <th><?php echo e(trans('file.product')); ?> (<?php echo e(trans('file.qty')); ?>)</th>
                            <th><?php echo e(trans('file.grand total')); ?></th>
                            <th><?php echo e(trans('file.Status')); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $__currentLoopData = $lims_quotation_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$quotation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td><?php echo e($key); ?></td>
                            <?php
                                $supplier = DB::table('suppliers')->find($quotation->supplier_id);
                            ?>
                            <td>
                        
                           
                           
                                                        <?php
                            $iran=date($general_setting->date_format, strtotime($quotation->created_at->toDateString()));
                        
                 
		list($gy, $gm, $gd) = explode('/', ($iran));
		$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //?????????? ??????????
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //?????????? ????????
                            echo $j_date_string.''.$sale->created_at->toTimeString()
                            ?>
                            
                                 </td>
                           
                            <td><?php echo e($quotation->reference_no); ?></td>
                            <td><?php echo e($quotation->warehouse->name); ?></td>
                            <?php if($supplier): ?>
                                <td><?php echo e($supplier->name); ?></td>
                            <?php else: ?>
                                <td>?????? ??????</td>
                            <?php endif; ?>
                            <td>
                                <?php $__currentLoopData = $lims_product_quotation_data[$key]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product_quotation_data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php 
                                    $product = App\Product::select('name')->find($product_quotation_data->product_id);
                                    if($product_quotation_data->variant_id) {
                                        $variant = App\Variant::find($product_quotation_data->variant_id);
                                        $product->name .= ' ['.$variant->name.']';
                                    }
                                    $unit = App\Unit::find($product_quotation_data->sale_unit_id);
                                ?>
                                <?php if($unit): ?>
                                    <?php echo e($product->name.' ('.$product_quotation_data->qty.' '.$unit->unit_code.')'); ?>

                                <?php else: ?>
                                    <?php echo e($product->name.' ('.$product_quotation_data->qty.')'); ?>

                                <?php endif; ?>
                                <br>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </td>
                            <td><?php echo e($quotation->grand_total); ?></td>
                            <?php if($quotation->quotation_status == 1): ?>
                            <td><div class="badge badge-danger"><?php echo e(trans('file.Pending')); ?></div></td>
                            <?php elseif($quotation->quotation_status == 2): ?>
                            <td><div class="badge badge-success"><?php echo e(trans('file.Sent')); ?></div></td>
                            <?php endif; ?>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </tbody>
                    <tfoot class="tfoot active">
                        <tr>
                            <th></th>
                            <th>??????????:</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>0.0</th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    $("ul#report").siblings('a').attr('aria-expanded','true');
    $("ul#report").addClass("show");
    $("ul#report #customer-report-menu").addClass("active");

    $('#customer_id').val($('input[name="customer_id_hidden"]').val());
    $('.selectpicker').selectpicker('refresh');

    $('#sale-table').DataTable( {
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
                'targets': 0
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
                    columns: ':visible:Not(.not-exported-sale)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_sale(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum_sale(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                text: '<?php echo e(trans("file.Column visibility")); ?>',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum_sale(api, false);
        }
    } );

    function datatable_sum_sale(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 5 ).footer() ).html(dt_selector.cells( rows, 5, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 7 ).footer() ).html(dt_selector.cells( rows, 7, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 5 ).footer() ).html(dt_selector.column( 5, {page:'current'} ).data().sum().toFixed(2));
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.column( 6, {page:'current'} ).data().sum().toFixed(2));
            $( dt_selector.column( 7 ).footer() ).html(dt_selector.cells( rows, 7, { page: 'current' } ).data().sum().toFixed(2));
        }
    }

    $('#payment-table').DataTable( {
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
                'targets': 0
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
                    datatable_sum_payment(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum_payment(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                text: '<?php echo e(trans("file.Column visibility")); ?>',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum_payment(api, false);
        }
    } );

    function datatable_sum_payment(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 4 ).footer() ).html(dt_selector.cells( rows, 4, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 4 ).footer() ).html(dt_selector.column( 4, {page:'current'} ).data().sum().toFixed(2));
        }
    }

    $('#return-table').DataTable( {
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
                'targets': 0
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
                    datatable_sum_return(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum_return(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                text: '<?php echo e(trans("file.Column visibility")); ?>',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum_return(api, false);
        }
    } );

    function datatable_sum_return(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.column( 6, {page:'current'} ).data().sum().toFixed(2));
        }
    }

    $('#quotation-table').DataTable( {
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
                'targets': 0
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
                    datatable_sum_quotation(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum_quotation(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                text: '<?php echo e(trans("file.Column visibility")); ?>',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum_quotation(api, false);
        }
    } );

    function datatable_sum_quotation(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.column( 6, {page:'current'} ).data().sum().toFixed(2));
        }
    }

$(".daterangepicker-field").daterangepicker({
  callback: function(startDate, endDate, period){
    var start_date = startDate.format('YYYY-MM-DD');
    var end_date = endDate.format('YYYY-MM-DD');
    var title = start_date + ' To ' + end_date;
    $(this).val(title);
    $('input[name="start_date"]').val(start_date);
    $('input[name="end_date"]').val(end_date);
  }
});

</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/edogroup/edosale.edogroup.ir/resources/views/report/customer_report.blade.php ENDPATH**/ ?>