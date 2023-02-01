 <?php $__env->startSection('content'); ?>

<section class="forms">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header mt-2">
                <h3 class="text-center"><?php echo e(trans('file.Payment Report')); ?></h3>
            </div>
       
        </div>
    </div>
    <div class="table-responsive mb-4">
        <table id="report-table" class="table table-hover">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th><?php echo e(trans('file.Date')); ?></th>
                    <th><?php echo e(trans('file.Payment Reference')); ?> </th>
                    <th><?php echo e(trans('file.Sale Reference')); ?></th>
                    <th><?php echo e(trans('file.Purchase Reference')); ?></th>
                    <th><?php echo e(trans('file.Paid By')); ?></th>
                    <th><?php echo e(trans('file.Amount')); ?></th>
                    <th><?php echo e(trans('file.Created By')); ?></th>
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
                
                
                <?php $__currentLoopData = $lims_payment_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $payment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php 
                    $sale = DB::table('sales')->find($payment->sale_id);
                    $purchase = DB::table('purchases')->find($payment->purchase_id);
                    $user = DB::table('users')->find($payment->user_id);
                ?>
                <tr>
                    <td></td>
                    <td>
                        
                        <?php
        date_default_timezone_set('Asia/Tehran');
		list($gy, $gm, $gd) = explode('-', ($payment->created_at->toDateString()));
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته

                        echo $j_date_string; 
                        ?> 
                        
                        
                        
                        <?php echo e($payment->created_at->toTimeString()); ?>

                    
                    
                    
                    
                    </td>
                    <td><?php echo e($payment->payment_reference); ?></td>
                    <td><?php if($sale): ?><?php echo e($sale->reference_no); ?><?php endif; ?></td>
                    <td><?php if($purchase): ?><?php echo e($purchase->reference_no); ?><?php endif; ?></td>
                    <td>
                    
                    
                    
                    
                     <?php
                                if ($payment->paying_method =="Cheque") {
                                echo "چک";

                                 }

 if ($payment->paying_method == "Cash") {
                                echo "نقدی";
 

                                 }
                                 
                                 
                                 
 if ($payment->paying_method == "Gift Card") {
                                echo "کارت هدیه";
 

                                 }
                                  if ($payment->paying_method == "Credit Card") {
                                echo "کارت اعتباری";
 

                                 }
                                    if ($payment->paying_method == "") {
                                echo "پرداخت";
 

                                 }
                                 
                                    if ($payment->paying_method == "Deposit") {
                                echo "سپرده";
 

                                 }
                                 
                                 
                                 
                                 
                                 
                                  ?>
                    
                    
                    
                    
                    
                    
                    
                    
                    </td>
                    
                    
                    
                    
                    
                    
                    
                    
                    <td style="    color: #009688 !important;">
                        <?php
                        
        $iran= number_format($payment->amount, 2);
 
     echo     substr($iran, 0, -3) .config('currency');
                        
                        
                        ?>
                        
                     
                    
                    
                    
                    </td>
                    <td><?php echo e($user->name); ?><br><?php echo e($user->email); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
        </table>
    </div>
</section>



<script type="text/javascript">
   $(function() {
        $("#input1, #span1").persianDatepicker();       
    });
    
    
</script>

<script type="text/javascript">
    $("ul#report").siblings('a').attr('aria-expanded','true');
    $("ul#report").addClass("show");
    $("ul#report li#payment-report-menu").addClass("active");

    $('#report-table').DataTable( {
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
            },
            {
                extend: 'colvis',
                text: '<?php echo e(trans("file.Column visibility")); ?>',
                columns: ':gt(0)'
            }
        ],
    } );
    

$(".daterangepicker-field").daterangepicker({
  callback: function(startDate, endDate, period){
    var start_date = startDate.format('YYYY-MM-DD');
    var end_date = endDate.format('YYYY-MM-DD');
    var title = start_date + ' to ' + end_date;
    $(this).val(title);
    $('input[name="start_date"]').val(start_date);
    $('input[name="end_date"]').val(end_date);
  }
});

</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/edogroup/edosale.edogroup.ir/resources/views/report/payment_report.blade.php ENDPATH**/ ?>