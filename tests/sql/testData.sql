BEGIN;

-- Plan the tests
SELECT plan( 1 );

SELECT results_eq(
    'SELECT source, target_table, histogram_groupings FROM meta_variables ORDER by id',
    $$VALUES ( 'mip-cde'::VARCHAR(256), 'MIP_CDE_FEATURES'::VARCHAR(256),   'dataset,gender,agegroup,alzheimerbroadcategory'::VARCHAR(256)),
             ( 'DATASET'::VARCHAR(256), 'MIP_LOCAL_FEATURES'::VARCHAR(256), 'dataset,gender,agegroup,alzheimerbroadcategory'::VARCHAR(256))$$,
    'meta_variables table should contain mip-cde and DATASET mip-local element descriptors'
);

-- Clean up
SELECT * FROM finish();
ROLLBACK;
