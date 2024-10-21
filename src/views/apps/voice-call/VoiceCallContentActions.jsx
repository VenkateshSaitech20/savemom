import Checkbox from '@mui/material/Checkbox';
import Tooltip from '@mui/material/Tooltip';
import IconButton from '@mui/material/IconButton';
import classnames from 'classnames';
import { deleteTrashEmails, moveEmailsToFolder, toggleLabel, toggleReadEmails } from '@/redux-store/slices/email';
import OptionMenu from '@core/components/option-menu';
import { labelColors } from './SidebarLeft';

const VoiceCallContentActions = props => {
  const {
    areFilteredEmailsNone,
    selectedEmails,
    setSelectedEmails,
    emails,
    folder,
    label,
    uniqueLabels,
    setReload,
    dispatch
  } = props

  // Vars
  const areAllSelected = selectedEmails.size > 0 && selectedEmails.size === emails.length
  const isIndeterminate = selectedEmails.size > 0 && selectedEmails.size < emails.length

  // Handle reload
  const handleReload = () => {
    setReload(true)
    setTimeout(() => {
      setReload(false)
    }, 2000)
  }

  // Toggle all emails' selection
  const handleSelectAllCheckboxes = () => {
    if (areAllSelected) {
      setSelectedEmails(new Set())
    } else {
      const visibleEmailIds = new Set(
        emails
          .filter(email => {
            if (folder === 'starred' && email.folder !== 'trash') {
              return email.isStarred
            } else if (label && uniqueLabels.includes(label) && email.folder !== 'trash') {
              return email.labels.includes(label)
            } else {
              return email.folder === folder
            }
          })
          .map(email => email.id)
      )
      setSelectedEmails(visibleEmailIds)
    }
  }

  // Delete selected emails
  const handleEmailDelete = () => {
    const emailIds = emails.filter(email => selectedEmails.has(email.id)).map(email => email.id)
    if (folder === 'trash') {
      dispatch(deleteTrashEmails({ emailIds }))
      setSelectedEmails(new Set())
    } else {
      dispatch(moveEmailsToFolder({ emailIds, folder: 'trash' }))
      setSelectedEmails(new Set())
    }
  }

  // Toggle all selected emails' read status
  const handleToggleAllReadEmails = () => {
    const emailIds = emails.filter(email => selectedEmails.has(email.id)).map(email => email.id)
    dispatch(toggleReadEmails({ emailIds }))
    setSelectedEmails(new Set())
  }

  // Move all selected emails to spam
  const handleMoveAllToSpam = () => {
    const emailIds = emails.filter(email => selectedEmails.has(email.id)).map(email => email.id)
    dispatch(moveEmailsToFolder({ emailIds, folder: 'spam' }))
    setSelectedEmails(new Set())
  }

  // Move all selected emails to inbox
  const handleMoveAllToInbox = () => {
    const emailIds = emails.filter(email => selectedEmails.has(email.id)).map(email => email.id)
    dispatch(moveEmailsToFolder({ emailIds, folder: 'inbox' }))
    setSelectedEmails(new Set())
  }

  // Handle click on label option from menu list
  const handleLabelClick = label => {
    const emailIds = emails.filter(email => selectedEmails.has(email.id)).map(email => email.id)
    dispatch(toggleLabel({ emailIds, label }))
    setSelectedEmails(new Set())
  }

  return (
    <div className='flex items-center justify-between gap-4 max-sm:gap-0.5 is-full pli-4 plb-2 border-be'>
      <div className='flex items-center gap-1 max-sm:gap-0.5'>
        <Checkbox
          indeterminate={isIndeterminate}
          checked={areAllSelected}
          onChange={handleSelectAllCheckboxes}
          disabled={areFilteredEmailsNone}
        />
        {(isIndeterminate || areAllSelected) && (
          <>
            <Tooltip title={folder === 'trash' ? 'Delete' : 'Move to trash'} placement='top'>
              <IconButton onClick={handleEmailDelete}>
                <i className='bx-trash text-textSecondary' />
              </IconButton>
            </Tooltip>
            <Tooltip
              title={
                selectedEmails.size > 0 &&
                  emails.filter(email => selectedEmails.has(email.id)).every(email => email.isRead)
                  ? 'Mark as unread'
                  : 'Mark as read'
              }
              placement='top'
            >
              <IconButton onClick={handleToggleAllReadEmails}>
                <i
                  className={classnames(
                    'text-textSecondary',
                    selectedEmails.size > 0 &&
                      emails.filter(email => selectedEmails.has(email.id)).every(email => email.isRead)
                      ? 'bx-envelope'
                      : 'bx-envelope-open'
                  )}
                />
              </IconButton>
            </Tooltip>
            {folder === 'inbox' && (
              <Tooltip title='Move to spam' placement='top'>
                <IconButton onClick={handleMoveAllToSpam}>
                  <i className='bx-info-circle text-textSecondary' />
                </IconButton>
              </Tooltip>
            )}
            {folder === 'spam' && (
              <Tooltip title='Move to inbox' placement='top'>
                <IconButton onClick={handleMoveAllToInbox}>
                  <i className='bx-bxs-inbox text-textSecondary' />
                </IconButton>
              </Tooltip>
            )}
            {folder === 'trash' && (
              <OptionMenu
                tooltipProps={{ title: 'Move to folder', placement: 'top' }}
                icon={<i className='bx-folder text-textSecondary' />}
                iconButtonProps={{ size: 'medium' }}
                options={[
                  {
                    text: 'Spam',
                    icon: <i className='bx-info-circle' />,
                    menuItemProps: { onClick: handleMoveAllToSpam }
                  },
                  {
                    text: 'Inbox',
                    icon: <i className='bx-bxs-inbox' />,
                    menuItemProps: { onClick: handleMoveAllToInbox }
                  }
                ]}
              />
            )}
            <OptionMenu
              tooltipProps={{ title: 'Toggle label', placement: 'top' }}
              icon={<i className='bx-label text-textSecondary' />}
              iconButtonProps={{ size: 'medium' }}
              options={Object.entries(labelColors).map(([key, value]) => ({
                text: key.charAt(0).toUpperCase() + key.slice(1),
                menuItemProps: { onClick: () => handleLabelClick(key) },
                icon: <i className={`bx-bxs-circle text-xs text-${value.color}`} />
              }))}
            />
          </>
        )}
      </div>
      <div className='flex gap-1 max-sm:gap-0.5'>
        <Tooltip title='Refresh' placement='top'>
          <IconButton onClick={handleReload}>
            <i className='bx-refresh text-textSecondary' />
          </IconButton>
        </Tooltip>
        <IconButton>
          <i className='bx-dots-vertical-rounded text-textSecondary' />
        </IconButton>
      </div>
    </div>
  )
}

export default VoiceCallContentActions