 <?php $__env->startSection('content'); ?>
<?php if(session()->has('message')): ?>
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo session()->get('message'); ?></div> 
<?php endif; ?>
<section class="forms">
    <div class="container-fluid">
        <h3><?php echo e(trans('file.Account Statement')); ?></h3>
        <strong><?php echo e(trans('file.Account')); ?>:</strong> <?php echo e($lims_account_data->name); ?> [<?php echo e($lims_account_data->account_no); ?>]
    </div>
    <div class="table-responsive mb-4">
        <table id="account-table" class="table table-hover">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th><?php echo e(trans('file.date')); ?></th>
                    <th><?php echo e(trans('file.reference')); ?></th>
                    <th><?php echo e(trans('file.Credit')); ?></th>
                    <th><?php echo e(trans('file.Debit')); ?></th>
                    <th><?php echo e(trans('file.Balance')); ?></th>
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
                
                
                <?php $__currentLoopData = $credit_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$credit): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $balance = $balance + $credit->amount; ?>
                <tr>
                    <td><?php echo e($key); ?></td>
                    <td>
                    
                    
                           <?php 
                                 
       $iran=date($general_setting->date_format, strtotime($credit->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
                   echo $j_date_string;
                    
                    ?> 
                    
                    
                    
                    
                    
                    </td>
                    
                    
                    <td><?php echo e($credit->payment_reference); ?></td>
                    <td>
                    
                    <?php
    $iran=number_format((float)$credit->amount, 2, '.', '');
     echo     substr($iran, 0, -3) ;
                    ?>
                    
                    
                    
                    </td>
                    <td>0.0</td>
                    <td><?php echo e(number_format((float)$balance, 2, '.', '')); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                <?php $__currentLoopData = $recieved_money_transfer_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$recieved_money): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $balance = $balance + $recieved_money->amount; ?>
                <tr>
                    <td><?php echo e($key); ?></td>
                    <td>
                    
                    
                    
                           <?php 
                                 
       $iran=date($general_setting->date_format, strtotime($recieved_money->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
                   echo $j_date_string;
                    ?> 
                    
                    
                    
                    
                    </td>
                    <td><?php echo e($recieved_money->reference_no); ?></td>
                    <td><?php echo e(number_format((float)$recieved_money->amount, 2, '.', '')); ?></td>
                    <td>0.0</td>
                    <td><?php echo e(number_format((float)$balance, 2, '.', '')); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                <?php $__currentLoopData = $debit_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$debit): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $balance = $balance - $debit->amount; ?>
                <tr>
                    <td><?php echo e($key); ?></td>
                    <td>
                    
                               <?php 
                                 
       $iran=date($general_setting->date_format, strtotime($debit->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));
	   $j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
       echo $j_date_string;

                    ?> 
                    
                    
                    
                    
                    </td>
                    <td><?php echo e($debit->payment_reference); ?></td>
                    <td>0.0</td>
                    <td><?php echo e(number_format((float)$debit->amount, 2, '.', '')); ?></td>
                    <td><?php echo e(number_format((float)$balance, 2, '.', '')); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                <?php $__currentLoopData = $return_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$return): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $balance = $balance - $return->grand_total; ?>
                <tr>
                    <td><?php echo e($key); ?></td>
                    <td>
         <?php 
       $iran=date($general_setting->date_format, strtotime($return->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));

		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته


                   echo $j_date_string;
                    

                    ?> 
                    
                    
                    
                    
                    
                    
                    </td>
                    <td><?php echo e($return->reference_no); ?></td>
                    <td>0.0</td>
                    <td><?php echo e(number_format((float)$return->grand_total, 2, '.', '')); ?></td>
                    <td><?php echo e(number_format((float)$balance, 2, '.', '')); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                <?php $__currentLoopData = $purchase_return_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$return): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $balance = $balance + $return->grand_total; ?>
                <tr>
                    <td><?php echo e($key); ?></td>
                    <td>
                    
                                       <?php 
                                 
       $iran=date($general_setting->date_format, strtotime($return->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));


		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته


                   echo $j_date_string;
                    

                    ?> 
                    
                    
                    
                    
                    
                    
                    
                    </td>
                    <td><?php echo e($return->reference_no); ?></td>
                    <td><?php echo e(number_format((float)$return->grand_total, 2, '.', '')); ?></td>
                    <td>0.0</td>
                    <td><?php echo e(number_format((float)$balance, 2, '.', '')); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                <?php $__currentLoopData = $expense_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$expense): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $balance = $balance - $expense->amount; ?>
                <tr>
                    <td><?php echo e($key); ?></td>
                    <td>
                    
                    
                    
                    
                        
                                                     <?php 
                                 
       $iran= date($general_setting->date_format, strtotime($expense->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));


		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته


                   echo $j_date_string;
                    

                    ?> 
                    
                    </td>
                    <td><?php echo e($expense->reference_no); ?></td>
                    <td>0.0</td>
                    <td><?php echo e(number_format((float)$expense->amount, 2, '.', '')); ?></td>
                    <td><?php echo e(number_format((float)$balance, 2, '.', '')); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                <?php $__currentLoopData = $payroll_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$payroll): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $balance = $balance - $payroll->amount; ?>
                <tr>
                    <td><?php echo e($key); ?></td>
                    <td>
                    
                    
                                                     <?php 
                                 
       $iran= date($general_setting->date_format, strtotime($payroll->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));


		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته


                   echo $j_date_string;
                    

                    ?> 
                    
                    
                    
                    
                    
                    
                    
                    </td>
                    <td><?php echo e($payroll->reference_no); ?></td>
                    <td>0.0</td>
                    <td><?php echo e(number_format((float)$payroll->amount, 2, '.', '')); ?></td>
                    <td><?php echo e(number_format((float)$balance, 2, '.', '')); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                <?php $__currentLoopData = $sent_money_transfer_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$sent_money): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $balance = $balance - $sent_money->amount; ?>
                <tr>
                    <td><?php echo e($key); ?></td>
                    <td>
                    
         <?php 
       $iran= date($general_setting->date_format, strtotime($sent_money->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته

                   echo $j_date_string;
                    

                    ?> 
                      
                    
                    
                    
                    
                    </td>
                    <td><?php echo e($sent_money->reference_no); ?></td>
                    <td>0.0</td>
                    <td>
                    
                    <?php
          $iran=number_format($sent_money->amount, 2);
           echo  $iran2=substr($iran, 0, -3).' '.config('currency');
                    ?>
                    
                    
                    
                    
                    </td>
                    <td>
             <?php
            $iran=number_format($balance, 2);
           echo  $iran2=substr($iran, 0, -3).' '.config('currency');
                    
                    ?>
                    
                    
                    
                    
                    
                    
                    
                    </td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
        </table>
    </div>
</section>

<script type="text/javascript">
    $("ul#account").siblings('a').attr('aria-expanded','true');
    $("ul#account").addClass("show");
    $("ul#account #account-statement-menu").addClass("active");

    var table = $('#account-table').DataTable( {
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
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "همه"]],
        dom: '<"row"lfB>rtip',
        buttons: [
        
            {
                extend: 'print',
                text: '<?php echo e(trans("file.Print")); ?>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                }
            },
            {
                extend: 'colvis',
                text: '<?php echo e(trans("file.Column visibility")); ?>',
                columns: ':gt(0)'
            },
        ],
    } );

</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/edogroup/edosale.edogroup.ir/resources/views/account/account_statement.blade.php ENDPATH**/ ?>