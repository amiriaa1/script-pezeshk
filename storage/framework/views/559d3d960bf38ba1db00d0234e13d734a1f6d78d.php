 <?php $__env->startSection('content'); ?>
<?php if(session()->has('message')): ?>
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo session()->get('message'); ?></div> 
<?php endif; ?>
<?php if(session()->has('not_permitted')): ?>
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div> 
<?php endif; ?>
<section>
    <div class="container-fluid">
        <button class="btn btn-info" data-toggle="modal" data-target="#createModal"><i class="dripicons-plus"></i> <?php echo e(trans('file.Add Holiday')); ?> </button>
    </div>
    <div class="table-responsive">
        <table id="holiday-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th><?php echo e(trans('file.date')); ?></th>
                    <th><?php echo e(trans('file.Employee')); ?></th>
                    <th><?php echo e(trans('file.From')); ?></th>
                    <th><?php echo e(trans('file.To')); ?></th>
                    <th><?php echo e(trans('file.Note')); ?></th>
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
                
                
                <?php $__currentLoopData = $lims_holiday_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$holiday): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr data-id="<?php echo e($holiday->id); ?>">
                    <td><?php echo e($key); ?></td>
                    <td>
                    
                              <?php
         date_default_timezone_set('Asia/Tehran');
		list($gy, $gm, $gd) = explode('-', ($holiday->created_at->toDateString()));
		$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //خروجی آرایه
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
       echo $j_date_string;
                        ?>
                    
                    </td>
                    <td><?php echo e($holiday->user->name); ?></td>
                    <td><?php echo e(date($general_setting->date_format, strtotime($holiday->from_date))); ?></td>
                    <td><?php echo e(date($general_setting->date_format, strtotime($holiday->to_date))); ?></td>
                    <td><?php echo e($holiday->note); ?></td>
                    <td>
                        <div class="btn-group">
                        	<?php if(!$holiday->is_approved && $approve_permission): ?>
                        	<button type="button" class="btn btn-sm btn-success btn-approve" title="<?php echo e(trans('file.Approve')); ?>" data-id="<?php echo e($holiday->id); ?>"><i class="fa fa-check"></i></button>
                        	<?php endif; ?>
                        	<button type="button" class="btn btn-sm btn-primary btn-edit" title="<?php echo e(trans('file.edit')); ?>" data-id="<?php echo e($holiday->id); ?>" data-from="<?php echo e(date($general_setting->date_format, strtotime($holiday->from_date))); ?>" data-to="<?php echo e(date($general_setting->date_format, strtotime($holiday->to_date))); ?>" data-note="<?php echo e($holiday->note); ?>" data-toggle="modal" data-target="#editModal" style="border-radius: 5px;
    padding: 0.25rem 0.5rem;
    font-size: 0.875rem;
    line-height: 1.5;    margin-left: 5px;"><i class="dripicons-document-edit"></i></button>
                            <?php echo e(Form::open(['route' => ['holidays.destroy', $holiday->id], 'method' => 'DELETE'] )); ?>

                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirmDelete()" title="<?php echo e(trans('file.delete')); ?>"><i class="dripicons-trash"></i></button>
                            <?php echo e(Form::close()); ?>

                        </div>
                    </td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
        </table>
    </div>
</section>

<div id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.Add Holiday')); ?></h5>
            </div>
            <div class="modal-body">
              <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                <?php echo Form::open(['route' => 'holidays.store', 'method' => 'post']); ?>

                <div class="row">
                    <div class="col-md-6 form-group">
                        <label><?php echo e(trans('file.From')); ?> *</label>
                        <input type="text" name="from_date" id="input1"  class="form-control form-control-sm"  required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label><?php echo e(trans('file.To')); ?> *</label>
                        <input type="text" name="to_date" id="input1"  class="form-control form-control-sm" required>
                    </div>
                    <div class="col-md-12 form-group">
                        <label><?php echo e(trans('file.Note')); ?></label>
                        <textarea name="note" rows="3" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary"><?php echo e(trans('file.submit')); ?></button>
                </div>
                <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
</div>

<div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.Update Holiday')); ?></h5>
            </div>
            <div class="modal-body">
              <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                <?php echo Form::open(['route' => ['holidays.update', 1], 'method' => 'put']); ?>

                <div class="row">
                    <div class="col-md-6 form-group">
                        <label><?php echo e(trans('file.From')); ?> *</label>
                        <input type="hidden" name="id">
                        <input type="text" name="from_date" id="input1" class="form-control form-control-sm" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label><?php echo e(trans('file.To')); ?> *</label>
                        <input type="text" name="to_date" id="input1" class="form-control form-control-sm" required>
                    </div>
                    <div class="col-md-12 form-group">
                        <label><?php echo e(trans('file.Note')); ?></label>
                        <textarea name="note" rows="3" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary"><?php echo e(trans('file.submit')); ?></button>
                </div>
                <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

	$("ul#hrm").siblings('a').attr('aria-expanded','true');
    $("ul#hrm").addClass("show");
    $("ul#hrm #holiday-menu").addClass("active");

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function confirmDelete() {
        if (confirm("Are you sure want to delete?")) {
            return true;
        }
        return false;
    }

    var holiday_id = [];
    var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;
    
	var date = $('.date');
    date.datepicker({
     format: "dd-mm-yyyy",
     startDate: "<?php echo date('d-m-Y'); ?>",
     autoclose: true,
     todayHighlight: true
     });

    $('.btn-approve').on('click', function() {
	    var id = $(this).data('id');
	    $.get('approve-holiday/'+id, function(data) {
	        $('.btn-approve').addClass('d-none');
	    });
	});

    $('.btn-edit').on('click', function() {
        $("input[name='id']").val($(this).data('id'));
        $("input[name='from_date']").val($(this).data('from'));
        $("input[name='to_date']").val($(this).data('to'));
        $("textarea[name='note']").val($(this).data('note'));        
    });    

    $('#holiday-table').DataTable( {
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
                'targets': [0, 6]
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
                    rows: ':visible',
                },
            },
            {
                text: '<?php echo e(trans("file.delete")); ?>',
                className: 'buttons-delete',
                action: function ( e, dt, node, config ) {
                    if(user_verified == '1') {
                        holiday_id.length = 0;
                        $(':checkbox:checked').each(function(i){
                            if(i){
                                holiday_id[i-1] = $(this).closest('tr').data('id');
                            }
                        });
                        if(holiday_id.length && confirm("Are you sure want to delete?")) {
                            $.ajax({
                                type:'POST',
                                url:'holidays/deletebyselection',
                                data:{
                                    holidayIdArray: holiday_id
                                },
                                success:function(data){
                                    alert(data);
                                }
                            });
                            dt.rows({ page: 'current', selected: true }).remove().draw(false);
                        }
                        else if(!holiday_id.length)
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
    } );
</script>


<script type="text/javascript">
   $(function() {
        $("#input1, #span1").persianDatepicker();       
    });
    
    
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\script\resources\views/holiday/index.blade.php ENDPATH**/ ?>