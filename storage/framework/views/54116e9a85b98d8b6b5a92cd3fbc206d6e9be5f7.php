
 <?php $__env->startSection('content'); ?>

<?php if(empty($product_name)): ?>
<div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e('هیچ داده ای بین این محدوده تاریخ وجود ندارد!'); ?></div>
<?php endif; ?>






<section class="forms">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header mt-2">
                <h3 class="text-center"><?php echo e(trans('file.Purchase Report')); ?></h3>
            </div>
       
        </div>
    </div>
    <div class="table-responsive mb-4">
        <table id="report-table" class="table table-hover">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th><?php echo e(trans('file.Product Name')); ?></th>
                    <th><?php echo e(trans('file.Purchased Amount')); ?></th>
                    <th><?php echo e(trans('file.Purchased Qty')); ?></th>
                    <th><?php echo e(trans('موجودی در انبار')); ?></th>
                </tr>
            </thead>
            <tbody>
                <?php if(!empty($product_name)): ?>
                <?php $__currentLoopData = $product_id; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $pro_id): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr>
                    <td><?php echo e($key); ?></td>
                    <td><?php echo e($product_name[$key]); ?></td>
                    <?php
                        if($warehouse_id == 0) {
                            if($variant_id[$key]) {
                                $purchased_cost = DB::table('product_purchases')->where([
                                    ['product_id', $pro_id],
                                    ['variant_id', $variant_id[$key] ]
                                ])->whereDate('created_at', '>=', $start_date)
                                  ->whereDate('created_at', '<=' , $end_date)
                                  ->sum('total');

                                $product_purchase_data = DB::table('product_purchases')->where([
                                    ['product_id', $pro_id],
                                    ['variant_id', $variant_id[$key] ]
                                ])->whereDate('created_at','>=', $start_date)
                                  ->whereDate('created_at','<=', $end_date)
                                  ->get();
                            }
                            else {
                                $purchased_cost = DB::table('product_purchases')->where('product_id', $pro_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=' , $end_date)->sum('total');

                                $product_purchase_data = DB::table('product_purchases')->where('product_id', $pro_id)->whereDate('created_at','>=', $start_date)->whereDate('created_at','<=', $end_date)->get();
                            }
                        }
                        else {
                            if($variant_id[$key]) {
                                $purchased_cost = DB::table('purchases')
                                    ->join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')->where([
                                        ['product_purchases.product_id', $pro_id],
                                        ['product_purchases.variant_id', $variant_id[$key] ],
                                        ['purchases.warehouse_id', $warehouse_id]
                                    ])->whereDate('purchases.created_at','>=', $start_date)->whereDate('purchases.created_at','<=', $end_date)->sum('total');
                                $product_purchase_data = DB::table('purchases')
                                    ->join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')->where([
                                        ['product_purchases.product_id', $pro_id],
                                        ['product_purchases.variant_id', $variant_id[$key] ],
                                        ['purchases.warehouse_id', $warehouse_id]
                                    ])->whereDate('purchases.created_at','>=', $start_date)->whereDate('purchases.created_at','<=', $end_date)->get();
                            }
                            else {
                                $purchased_cost = DB::table('purchases')
                                    ->join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')->where([
                                        ['product_purchases.product_id', $pro_id],
                                        ['purchases.warehouse_id', $warehouse_id]
                                    ])->whereDate('purchases.created_at','>=', $start_date)->whereDate('purchases.created_at','<=', $end_date)->sum('total');
                                $product_purchase_data = DB::table('purchases')
                                    ->join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')->where([
                                        ['product_purchases.product_id', $pro_id],
                                        ['purchases.warehouse_id', $warehouse_id]
                                    ])->whereDate('purchases.created_at','>=', $start_date)->whereDate('purchases.created_at','<=', $end_date)->get();
                            }
                        }
                        $purchased_qty = 0;
                        foreach ($product_purchase_data as $product_purchase) {
                            $unit = DB::table('units')->find($product_purchase->purchase_unit_id);
                            if($unit->operator == '*'){
                                $purchased_qty += $product_purchase->qty * $unit->operation_value;
                            }
                            elseif($unit->operator == '/'){
                                $purchased_qty += $product_purchase->qty / $unit->operation_value;
                            }
                        }
                    ?>
                    <td style="    color: #009688 !important;">
                        
                        
                        
                                    <?php
                        
        $iran= number_format($purchased_cost, 2);
 
     echo     substr($iran, 0, -3) .config('currency');
                        
                        
                        ?>
                        
               
               
                    
                    </td>
                    <td><?php echo e($purchased_qty); ?></td>
                    <td><?php echo e($product_qty[$key]); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endif; ?>
            </tbody>
            <tfoot>
                <th></th>
                <th>مجموع :</th>
                <th>0.0</th>
                <th>0</th>
                <th>0</th>
            </tfoot>
        </table>
    </div>
</section>


<script type="text/javascript">
    $("ul#report").siblings('a').attr('aria-expanded','true');
    $("ul#report").addClass("show");
    $("ul#report #purchase-report-menu").addClass("active");

    $('#warehouse_id').val($('input[name="warehouse_id_hidden"]').val());
    $('.selectpicker').selectpicker('refresh');

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
                    columns: ':visible:not(.not-exported)',
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
                extend: 'colvis',
                text: '<?php echo e(trans("file.Column visibility")); ?>',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum(api, false);
        }
    } );

    function datatable_sum(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 2 ).footer() ).html(dt_selector.cells( rows, 2, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 3 ).footer() ).html(dt_selector.cells( rows, 3, { page: 'current' } ).data().sum());
            $( dt_selector.column( 4 ).footer() ).html(dt_selector.cells( rows, 4, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 2 ).footer() ).html(dt_selector.column( 2, {page:'current'} ).data().sum().toFixed(2));
            $( dt_selector.column( 3 ).footer() ).html(dt_selector.column( 3, {page:'current'} ).data().sum());
            $( dt_selector.column( 4 ).footer() ).html(dt_selector.column( 4, {page:'current'} ).data().sum().toFixed(2));
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





<script type="text/javascript">
   $(function() {
        $("#input1, #span1").persianDatepicker();       
    });
    
    
</script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/edomeir/public_html/salepro/resources/views/report/purchase_report.blade.php ENDPATH**/ ?>